import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softcity/constants/constants.dart';
import 'package:softcity/constants/sizeconfig.dart';
import 'package:softcity/providers/provider_swich_listtile.dart';

class YangiliklarPage extends StatelessWidget {
  const YangiliklarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(
        width: getWidth(370),
        height: getHeight(700),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getHeight(159),
                width: getWidth(335),
                margin: EdgeInsets.only(
                  top: getHeight(20),
                  right: getWidth(20),
                  left: getWidth(20),
                ),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/foodball.jpg"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(getHeight(10)),
                ),
              ),
              Container(
                // height: getHeight(335),
                width: getWidth(335),
                margin: EdgeInsets.all(getHeight(20)),
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(14),
                  vertical: getHeight(26),
                ),
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
                      margin: EdgeInsets.only(bottom: getHeight(15)),
                      child: Text(
                        "Real Mardir oyini",
                        style: TextStyle(
                          color: context.watch<ProviderThemeChanger>().isLight
                              ? colorBlue
                              : textColor,
                          fontSize: getHeight(18),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      """Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text. “It's not Latin, though it looks like it, and it actually says nothing,” Before & After magazine answered a curious reader, “Its ‘words’ loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.”

As Cicero would put it, “Um, not so fast.”

The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin.

Richard McClintock, a Latin scholar from Hampden-Sydney College, is credited with discovering the source behind the ubiquitous filler text. In seeing a sample of lorem ipsum, his interest was piqued by consectetur—a genuine, albeit rare, Latin word. Consulting a Latin dictionary led McClintock to a passage from De Finibus Bonorum et Malorum (“On the Extremes of Good and Evil”), a first-century B.C. text from the Roman philosopher Cicero.""",
                      style: TextStyle(
                        color: context.watch<ProviderThemeChanger>().isLight
                            ? Colors.white
                            : textColor,
                        fontSize: getHeight(14),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
