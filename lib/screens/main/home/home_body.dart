import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/models/banner_get.dart';
import 'package:softcity/models/get_matches_res.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/screens/main/home/banner_video.dart';
import 'package:softcity/screens/main/home/info_page/info_page.dart';
import 'package:softcity/screens/widgets/diwider.dart';
import 'package:softcity/service/banner/banner_service.dart';
import 'package:softcity/service/matche/matches_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String status = GetStorage().read('status') ?? '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<List<BannerGet>>(
            future: getBanner(),
            builder: (context, AsyncSnapshot<List<BannerGet>> snap) {
              if (snap.hasData) {
                YoutubePlayerController controller = YoutubePlayerController(
                  initialVideoId: snap.data![0].link!,
                  flags: const YoutubePlayerFlags(autoPlay: true, mute: true),
                );
                debugPrint("aaaaaaaaaaaaaaaa ${snap.data![0].link}");
                return Container(
                  margin: EdgeInsets.only(top: getHeight(20)),
                  height: getHeight(120),
                  width: getWidth(340),
                  color: Colors.transparent,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    color: const Color(0xffC7DDF2),
                    strokeWidth: 2,
                    dashPattern: const [5, 5],
                    child: Container(
                      alignment: Alignment.center,
                      height: getHeight(120),
                      width: getWidth(340),
                      decoration: BoxDecoration(
                        color: context.watch<ProviderThemeChanger>().isLight
                            ? colorBottomNavigationBarColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: YouTubePlayerWidget(links: snap.data![1].link!),
                    ),
                  ),
                );
              } else if (snap.hasError) {
                debugPrint('eeeeeeeeeeeeeeeeerror');

                return Text(snap.hasError.toString());
              } else if (snap.data == null) {
                return const Center(
                    child: CupertinoActivityIndicator(radius: 20.0));
              }
              return const Center(
                  child: CupertinoActivityIndicator(radius: 20.0));
            },
          ),
          FutureBuilder<List<GetMatchesResponce>>(
            future: getMatches(),
            builder: (context, AsyncSnapshot<List<GetMatchesResponce>> snap) {
              String token = GetStorage().read('token');
              if (snap.hasData) {
                bool torimi = JwtDecoder.isExpired(token);
                DateTime expirationData = JwtDecoder.getExpirationDate(token);
                DateTime now = DateTime.now();
                int yil = expirationData.year;
                int oy = expirationData.month;
                int kun = expirationData.day;

                int yilNow = now.year;
                int oyNow = now.month;
                int kunNow = now.day;
                debugPrint("token srogi yil: $yil, oy: $oy, kun: $kun");
                debugPrint(
                    "datetim now yil: $yilNow, oy: $oyNow, kun: $kunNow");
                debugPrint(
                    "date time kelishi kerak shu yerdan $expirationData");
                debugPrint(torimi.toString());
                return Container(
                  margin: EdgeInsets.only(top: getHeight(20)),
                  height: getHeight(500),
                  width: getWidth(335),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6),
                    color: context.watch<ProviderThemeChanger>().isLight
                        ? colorBottomNavigationBarColor
                        : Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: getHeight(21)),
                        child: Text(
                          expirationData.toString(),
                          style: TextStyle(
                            fontSize: getHeight(10),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        height: getHeight(435),
                        width: getWidth(335),
                        margin: EdgeInsets.only(top: getHeight(28)),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    if (status == '0') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              InfoPage(index: index),
                                        ),
                                      );
                                    }
                                  },
                                  leading: SizedBox(
                                    width: getHeight(120),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: getHeight(15),
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: NetworkImage(
                                            'https://sinov.sinovuz.uz/${snap.data![index].firstTimePhoto}',
                                          ),
                                        ),
                                        SizedBox(
                                          width: getWidth(89),
                                          child: Text(
                                            snap.data![index].firstTimeName ??
                                                '',
                                            style: TextStyle(
                                              color: context
                                                      .watch<
                                                          ProviderThemeChanger>()
                                                      .isLight
                                                  ? Colors.white
                                                  : const Color(0xff4E4B66),
                                              fontSize: getHeight(15),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  title: Center(
                                    child: Text(
                                      snap.data![index].id.toString(),
                                    ),
                                  ),
                                  trailing: SizedBox(
                                    width: getWidth(120),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: getHeight(15),
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: NetworkImage(
                                            "https://sinov.sinovuz.uz/${snap.data![index].secondTimePhoto}",
                                          ),
                                        ),
                                        SizedBox(
                                          width: getWidth(89),
                                          child: Text(
                                            snap.data![index].secondTimeName ??
                                                '',
                                            style: TextStyle(
                                              color: context
                                                      .watch<
                                                          ProviderThemeChanger>()
                                                      .isLight
                                                  ? Colors.white
                                                  : const Color(0xff4E4B66),
                                              fontSize: getHeight(15),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                DiwiderClass(),
                              ],
                            );
                          },
                          itemCount: snap.data!.length,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snap.hasError) {
                debugPrint('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxatto ketti');
              } else if (snap.data == null) {
                return const Center(
                    child: CupertinoActivityIndicator(radius: 20.0));
              }
              return const Center(
                  child: CupertinoActivityIndicator(radius: 20.0));
            },
          ),
        ],
      ),
    );
  }
}
