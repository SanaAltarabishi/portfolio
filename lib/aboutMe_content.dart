import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AboutMeContent extends StatelessWidget {
  const AboutMeContent({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT ME',
            style: GoogleFonts.alegreyaSc(
              textStyle: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffcdc4c3),
                  shadows: [
                    Shadow(
                        color: Color(0xff4f96d2),
                        blurRadius: 2,
                        offset: Offset(7, 5))
                  ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: screenWidth * 0.5,
            child: Text(
              'I am a dedicated learner with a strong interest in mastering Flutter, especially in the realm of animations. I enjoy crafting dynamic user interfaces that captivate users. I continually explore various animation techniques to enhance the visual appeal and interactivity of my apps. My commitment to creating seamless and engaging user experiences drives my passion for learning. I aim to become a skilled Flutter developer renowned for my expertise in animations.',
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  color: Color(0xff4e5462),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              maxLines: 20,
            ),
          )
        ],
      ),
    );
  }
}
