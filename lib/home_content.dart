import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeColumnContent extends StatelessWidget {
  const HomeColumnContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = GoogleFonts.brawler(
      textStyle: const TextStyle(
        color: Color(0xffcdc4c3),
        fontSize: 50,
        fontWeight: FontWeight.w900,
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150,
        ),
        Text(
          "i'm a",
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              color: Color(0xff4e5462),
              fontSize: 50,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Text(
          'passionate learner ',
          style: GoogleFonts.brawler(
            textStyle: const TextStyle(
              color: Color(0xffcdc4c3),
              fontSize: 50,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          'of Flutter and mobile',
          style: textStyle,
        ),
        Text(
          'app development ...',
          style: textStyle,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            gradient: const LinearGradient(
              colors: [
                Color(0xff3c28b5),
                Color(0xff4f96d2),
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'Curriculum Vitae',
              style: TextStyle(
                color: Color(0xffcdc4c3),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
            .animate(
              onComplete: (controller) => controller.repeat(),
            )
            .shimmer(duration: 5.seconds)
      ],
    );
  }
}
