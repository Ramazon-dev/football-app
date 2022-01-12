// import 'package:flutter/material.dart';
// import 'package:softcity/constants/sizeconfig.dart';
// import 'package:softcity/widgets/appbar.dart';
// import 'package:softcity/widgets/bottom_nav_bar.dart';

// class AboutPage extends StatelessWidget {
//   const AboutPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: AppBarClass.myAppBar(),
//       bottomNavigationBar: MyBottomBar(),
//       body: SizedBox(
//         width: getWidth(370),
//         height: getHeight(700),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: getWidth(335),
//                 margin: EdgeInsets.all(getHeight(20)),
//                 padding: EdgeInsets.symmetric(
//                   vertical: getHeight(26),
//                   horizontal: getWidth(14),
//                 ),
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 3,
//                       blurRadius: 7,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(getHeight(6)),
//                   color: Colors.white,
//                 ),
//                 child: Text(
//                   """Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text. “It's not Latin, though it looks like it, and it actually says nothing,” Before & After magazine answered a curious reader, “Its ‘words’ loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.”

// As Cicero would put it, “Um, not so fast.”

// The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin.

// Richard McClintock, a Latin scholar from Hampden-Sydney College, is credited with discovering the source behind the ubiquitous filler text. In seeing a sample of lorem ipsum, his interest was piqued by consectetur—a genuine, albeit rare, Latin word. Consulting a Latin dictionary led McClintock to a passage from De Finibus Bonorum et Malorum (“On the Extremes of Good and Evil”), a first-century B.C. text from the Roman philosopher Cicero.""",
//                   style: TextStyle(
//                     color: const Color(0xff838383),
//                     fontSize: getHeight(14),
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
