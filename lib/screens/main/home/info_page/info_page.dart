import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/models/get_matches_res.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/screens/widgets/appbar.dart';
import 'package:softcity/service/matche/matches_service.dart';

class InfoPage extends StatelessWidget {
  int index;
  InfoPage({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const AppBarClass(),
      body: FutureBuilder<List<GetMatchesResponce>>(
        future: getMatches(),
        builder: (context, AsyncSnapshot<List<GetMatchesResponce>> snap) {
          if (snap.hasData) {
            String? data = snap.data![index].matchDate ?? '';
            List<String>? datamas = data.split('T');
            debugPrint(
                "PPPPPPPPPPPPPPPPPPPPPP ${snap.data![index].firstTimePhoto}");
            return Container(
              // height: getHeight(470),
              width: getWidth(335),
              margin: EdgeInsets.all(getHeight(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: context.watch<ProviderThemeChanger>().isLight
                    ? colorBottomNavigationBarColor
                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: getHeight(73),
                      width: getWidth(335),
                      margin: EdgeInsets.only(
                        top: getHeight(28),
                        left: getWidth(20),
                        right: getWidth(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                height: getHeight(52),
                                width: getWidth(39),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://sinov.sinovuz.uz/${snap.data![index].firstTimePhoto}',
                                    ),
                                  ),
                                ),
                              ),
                              Text(snap.data![index].firstTimeName ?? ''),
                            ],
                          ),
                          SizedBox(
                            height: getHeight(60),
                            width: getWidth(80),
                            child: Column(
                              children: [
                                Text(
                                  datamas[0],
                                  style: TextStyle(
                                    fontSize: getHeight(15),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Divider(
                                  thickness: 1.5,
                                ),
                                Text(
                                  (datamas[1]),
                                  style: TextStyle(
                                    fontSize: getHeight(13),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                height: getHeight(52),
                                width: getWidth(39),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://sinov.sinovuz.uz/${snap.data![index].secondTimePhoto}",
                                    ),
                                  ),
                                ),
                              ),
                              Text(snap.data![index].secondTimeName ?? ''),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: getHeight(20)),
                      margin: EdgeInsets.all(getHeight(20)),
                      child: Text(
                        snap.data![index].textDescription ?? '',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snap.hasError) {
            debugPrint('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxatto ketti');
            return const Center(
                child: CupertinoActivityIndicator(radius: 20.0));
          } else if (snap.data == null) {
            return const Center(
                child: CupertinoActivityIndicator(radius: 20.0));
          }
          return const Center(child: CupertinoActivityIndicator(radius: 20.0));
        },
      ),
    );
  }
}
