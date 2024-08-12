import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mix/mix.dart';

class ExperiencesRow extends StatelessWidget {
  const ExperiencesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        experienceContent('assets/images/flutter1.png', 'Flutter'),
        experienceContent('assets/images/java.png', 'Jave'),
        experienceContent('assets/images/algorithm.png', 'algorithm'),
        experienceContent('assets/images/c++.png', 'c++'),
      ],
    );
  }

  Column experienceContent(String image, String text) {
    return Column(
      children: [
        PressableBox(
          style: Style(
            $box.width(80),
            $box.height(80),
            $on.hover(
              $with.scale(1.2),
            ),
          ),
          child: Image.asset(image),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              color: Color(0xff4e5462),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
