import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofolio_app/model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectRowWidget extends StatelessWidget {
  final ProjectRow project;
  final int index;
  final VisibilityIndex ind;
  final bool isVisible;
  final Function(VisibilityIndex, bool) onVisibilityChanged;
  const ProjectRowWidget({
    super.key,
    required this.project,
    required this.index,
    required this.ind,
    required this.isVisible,
    required this.onVisibilityChanged,
  });

  Future<void> _onOpen(LinkableElement link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    bool isEven = index % 2 == 0;
    return VisibilityDetector(
      key: Key(project.keyName),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 0) {
          onVisibilityChanged(ind, false);
          // project.setFirstProVisible(false);
        } else {
          onVisibilityChanged(ind, true);
          //! i have to keep the index =2 how ?!
          // project.setFirstProVisible(true);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: isEven
            ? [
                buildTextColumn(screenWidth),
                buildImage(screenWidth, screenHeight),
              ]
            : [
                buildImage(screenWidth, screenHeight),
                // SizedBox(width: 50),
                buildTextColumn(screenWidth),
              ],
      ),
    );
  }

  Widget buildImage(double screenWidth, double screenHeight) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
      transform: Matrix4.translationValues(
          isVisible ? 0 : project.imageDirection * screenWidth, 0, 0),
      child: SizedBox(
        height: 400,
        width: 450,
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 65,
              child: Container(
                margin: const EdgeInsets.only(left: 50),
                width: screenWidth * 0.163, //250,
                height: screenHeight * 0.312, //250,
                decoration: const BoxDecoration(
                  color: Color(0xff131635),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple,
                      offset: Offset(-1, -1),
                      blurRadius: 6,
                    ),
                    BoxShadow(
                      color: Colors.blue,
                      offset: Offset(1, 1),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              //90:115,,35:50
              left: project.projectMoved ? screenWidth * 0.06 : screenWidth*0.075,
              top: project.projectMoved ? screenHeight * 0.04 : screenHeight*0.062,
              duration: const Duration(seconds: 1),
              child: MouseRegion(
                onEnter: (_) => project.moveFirstProImage(false),
                onExit: (_) => project.moveFirstProImage(true),
                child: Container(
                  width: screenWidth * 0.163, //250,
                  height: screenHeight * 0.312, //250,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        project.image,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
//TODO : we have to fix the width and the height
  Widget buildTextColumn(double screenWidth) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      transform: Matrix4.translationValues(
          isVisible ? 0 : project.columnDirection * screenWidth, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.projectName,
            style: GoogleFonts.varelaRound(
              textStyle: const TextStyle(
                color: Color(0xff4f96d2),
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            project.projectDiscription,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                color: Color(0xff4e5462),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            project.projectTools,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                color: Color(0xff4e5462),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "LINK: ",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color(0xff4c6890),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SelectableLinkify(
                onOpen: _onOpen,
                linkStyle: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color(0xff4c6890),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff4c6890),
                    decorationThickness: 5,
                  ),
                ),
                text: project.projectLink,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
