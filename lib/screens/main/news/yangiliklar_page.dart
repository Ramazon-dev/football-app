import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/models/news_get.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';
import 'package:softcity/service/news/news_service.dart';

class YangiliklarPage extends StatelessWidget {
  const YangiliklarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: FutureBuilder<List<GetNews>>(
        future: getNews(),
        builder: (context, AsyncSnapshot<List<GetNews>> snap) {
          if (snap.hasData) {
            return SizedBox(
              width: getWidth(370),
              height: getHeight(700),
              child: ListView.builder(
                itemCount: snap.data!.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: getWidth(335),
                          margin: EdgeInsets.all(getHeight(20)),
                          padding: EdgeInsets.only(
                            // left: getWidth(20),
                            // right: getWidth(20),
                            bottom: getHeight(14),
                          ),
                          // padding: EdgeInsets.symmetric(
                          //   horizontal: getWidth(14),
                          //   vertical: getHeight(26),
                          // ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(getHeight(6)),
                            color: context.watch<ProviderThemeChanger>().isLight
                                ? colorBottomNavigationBarColor
                                : Colors.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: getHeight(159),
                                width: getWidth(335),
                                margin: EdgeInsets.only(bottom: getHeight(20)),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://sinov.sinovuz.uz/${snap.data![index].photo}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(getHeight(10)),
                                    topRight: Radius.circular(getHeight(10)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: getHeight(15)),
                                child: Text(
                                  snap.data![index].title ?? '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: context
                                            .watch<ProviderThemeChanger>()
                                            .isLight
                                        ? colorBlue
                                        : textColor,
                                    fontSize: getHeight(18),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                // width: getWidth(335),
                                margin: EdgeInsets.symmetric(
                                    horizontal: getWidth(20)),
                                alignment: Alignment.center,
                                child: Text(
                                  snap.data![index].discription ?? '',
                                  style: TextStyle(
                                    color: context
                                            .watch<ProviderThemeChanger>()
                                            .isLight
                                        ? Colors.white
                                        : textColor,
                                    fontSize: getHeight(14),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (snap.hasError) {
            return const Center(child: Text("Error"));
          } else if (snap.data == null) {
            return const Center(child: CupertinoActivityIndicator(radius: 20));
          }
          return const Center(child: CupertinoActivityIndicator(radius: 20));
        },
      ),
    );
  }
}
