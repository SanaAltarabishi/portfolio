import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.buttonText,
  });
  final int index;
  final int selectedIndex;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      style: GoogleFonts.alegreyaSc(
        textStyle: TextStyle(
          color: selectedIndex == index ? Color(0xff4f96d2) : Color(0xffcdc4c3),
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    );
  }
}

// class AppBarContent extends StatelessWidget {
//   final int selectedIndex;
//   final Function(GlobalKey, int) onPressed;
//   final GlobalKey homeKey;
//   final GlobalKey aboutMeKey;
//   final GlobalKey portfolioKey;
//   final GlobalKey servicesKey;
//   final GlobalKey contactKey;

//   const AppBarContent({
//     Key? key,
//     required this.selectedIndex,
//     required this.onPressed,
//     required this.homeKey,
//     required this.aboutMeKey,
//     required this.portfolioKey,
//     required this.servicesKey,
//     required this.contactKey,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Text(
//           "S",
//           style: GoogleFonts.alegreyaSc(
//             textStyle: const TextStyle(
//               color: Color(0xff4f96d2),
//               fontWeight: FontWeight.w400,
//               fontSize: 50,
//             ),
//           ),
//         ),
//         _AppBarButton(
//           label: 'HOME',
//           index: 0,
//           selectedIndex: selectedIndex,
//           onPressed: onPressed,
//           key: homeKey,
//         ),
//         _AppBarButton(
//           label: 'ABOUT ME',
//           index: 1,
//           selectedIndex: selectedIndex,
//           onPressed: onPressed,
//           key: aboutMeKey,
//         ),
//         _AppBarButton(
//           label: 'PORTFOLIO',
//           index: 2,
//           selectedIndex: selectedIndex,
//           onPressed: onPressed,
//           key: portfolioKey,
//         ),
//         _AppBarButton(
//           label: 'SERVICES',
//           index: 3,
//           selectedIndex: selectedIndex,
//           onPressed: onPressed,
//           key: servicesKey,
//         ),
//         GestureDetector(
//           onTap: () {
//             onPressed(contactKey, 4);
//           },
//           child: Container(
//             padding: const EdgeInsets.all(5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(7),
//               gradient: const LinearGradient(
//                 colors: [
//                   Color(0xff3c28b5),
//                   Color(0xff3c28b5),
//                   Color(0xff4f96d2),
//                 ],
//               ),
//             ),
//             child: Text(
//               'CONTACT',
//               style: GoogleFonts.alegreyaSc(
//                 textStyle: TextStyle(
//                   color: selectedIndex == 4 ? Color(0xff4f96d2) : Color(0xffcdc4c3),
//                   fontWeight: FontWeight.w400,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _AppBarButton extends StatelessWidget {
//   final String label;
//   final int index;
//   final int selectedIndex;
//   final Function(GlobalKey, int) onPressed;
//   final GlobalKey key;

//   const _AppBarButton({
//     required this.label,
//     required this.index,
//     required this.selectedIndex,
//     required this.onPressed,
//     required this.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         onPressed(key, index);
//       },
//       child: Text(
//         label,
//         style: GoogleFonts.alegreyaSc(
//           textStyle: TextStyle(
//             color: selectedIndex == index ? Color(0xff4f96d2) : Color(0xffcdc4c3),
//             fontWeight: FontWeight.w400,
//             fontSize: 20,
//           ),
//         ),
//       ),
//     );
//   }
// }
