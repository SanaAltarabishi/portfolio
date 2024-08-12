import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(170, 85, 74, 149).withOpacity(0.2),
            const Color.fromARGB(255, 93, 76, 193).withOpacity(0.5),
            const Color.fromARGB(255, 93, 76, 193).withOpacity(0.4),
            const Color(0xff4f96d2).withOpacity(0.8),
            const Color(0xff131635),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(100),
          topRight: Radius.circular(100),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'CONTACT',
              style: GoogleFonts.wendyOne(
                textStyle: TextStyle(
                  fontSize: screenWidth * 0.025,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffcdc4c3),
                  shadows: const [
                    Shadow(
                      color: Colors.white,
                      offset: Offset(-3, 0),
                      blurRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Drop me a message",
                        style: GoogleFonts.wendyOne(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.02, //20,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffcdc4c3),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        iconContainer(
                          Icons.phone_outlined,
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        textContainer('0951000000', screenWidth)
                      ],
                    ),
                    Row(
                      children: [
                        iconContainer(
                          Icons.email_outlined,
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        textContainer(
                            'sanaaltarabishi20@gamil.com', screenWidth),
                      ],
                    ),
                    Row(
                      children: [
                        iconContainer(
                          Icons.location_on_outlined,
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        textContainer('Syria,Damascus', screenWidth),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.3,
                  child: Lottie.asset(
                    'assets/computarAnim.json',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container iconContainer(IconData icon) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            blurRadius: 2,
          )
        ],
        gradient: const LinearGradient(
          colors: [
            Color(0xff3c28b5),
            Color(0xff4f96d2),
          ],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  Text textContainer(String text, double screenWidth) {
    return Text(
      text,
      style: GoogleFonts.alegreyaSc(
        textStyle: TextStyle(
          fontSize: screenWidth * 0.012, //20,
          fontWeight: FontWeight.w500,
          color:const Color.fromARGB(255, 87, 88, 102),
        ),
      ),
    );
  }
}
