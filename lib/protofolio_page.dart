import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:protofolio_app/aboutMe_content.dart';
import 'package:protofolio_app/appBar_content_widget.dart';
import 'package:protofolio_app/experiencesRow_widget.dart';
import 'package:protofolio_app/home_content.dart';
import 'package:protofolio_app/project_row_widget.dart';
import 'package:protofolio_app/contact_contianer_widget.dart';
import 'package:protofolio_app/model.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProtofolioPage extends StatefulWidget {
  const ProtofolioPage({super.key});

  @override
  State<ProtofolioPage> createState() => _ProtofolioPageState();
}

class _ProtofolioPageState extends State<ProtofolioPage> {
  late ScrollController scrollController;

  GlobalKey stackSliverKey = GlobalKey();
  GlobalKey aboutMeKey = GlobalKey();
  GlobalKey protofolioKey = GlobalKey();
  GlobalKey experiencesKey = GlobalKey();
  GlobalKey contactKay = GlobalKey();

  final List<bool> _visibilityList =
      List.filled(VisibilityIndex.values.length, false);

  void _setVisibilit(VisibilityIndex index, bool visible) {
    setState(() {
      _visibilityList[index.index] = visible;
    });
  }

//for image hovering :
  final List<bool> _movementList =
      List.filled(MovementIndex.values.length, true);

  void _setMovement(MovementIndex index, bool isHovering) {
    setState(() {
      _movementList[index.index] = isHovering;
    });
  }

  bool _isMoved = false;

  void _moveContainer(bool isHovering) {
    setState(() {
      _isMoved = isHovering;
    });
  }

  late List<ProjectRow> projects;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

//  appbar buttons color:
  int _selectedIndex = -1;
// scroll by the buttons :
  void _scrollToKey(GlobalKey key, int index) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: Duration(seconds: 1));
      setState(() {
        _selectedIndex = index;
      });
    }
  }

// write the word in slanted way :
  List<Widget> _buildSlantedText() {
    List<Widget> letters = [];
    String text = 'DEVELOPER';
    for (int i = 0; i < text.length; i++) {
      letters.add(
        Transform.translate(
            offset: Offset(i * 2, i * (-40)),
            child: Text(
              text[i],
              style: TextStyle(
                  color: Color(0xffcdc4c3).withOpacity(0.1),
                  fontSize: 180,
                  fontWeight: FontWeight.bold),
            ).animate(
              onComplete: (controller) {
                controller.repeat();
              },
            ).shimmer(duration: 2.seconds, colors: [
              Colors.white,
              Colors.grey,
            ])),
      );
    }
    return letters;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    projects = [
      ProjectRow(
        keyName: "firstProject",
        // setFirstProVisible: _setFirstProVisible,
        // isFirstProVisible: _isFirstProVisible,
        imageDirection: 1,
        moveFirstProImage: (isHovering) =>
            _setMovement(MovementIndex.firstProject, isHovering),
        image: 'assets/images/sky.jpg',
        columnDirection: -1,
        projectName: 'PROJECT 1',
        projectDiscription: 'A 3D simulation of outer space and night sky',
        projectTools:
            'flutter_animate,flextras,extra_alignments,gap,provider,rnd,vector_math',
        projectLink: 'https://github.com/SanaAltarabishi/space_animation.git',
        projectMoved: _movementList[MovementIndex.firstProject.index],
      ),
      ProjectRow(
        keyName: 'secondProject',
        // setFirstProVisible: _setSecondProVisible,
        //isFirstProVisible: _isSecondProVisible,
        imageDirection: -1,
        moveFirstProImage: (isHovering) =>
            _setMovement(MovementIndex.secondProject, isHovering),
        image: 'assets/images/todo.png',
        columnDirection: 1,
        projectName: 'PROJECT 2',
        projectDiscription: 'help you to stay organized & productive',
        projectTools: 'Dio,Flutter_bloc,Mock storage',
        projectLink: 'https://github.com/SanaAltarabishi/Todo_app.git',
        projectMoved: _movementList[MovementIndex.secondProject.index],
      ),
      ProjectRow(
        keyName: 'ThirdProject',
        // setFirstProVisible: _setThirdProVisible,
        //isFirstProVisible: _isThirdProVisible,
        imageDirection: 1,
        moveFirstProImage: (isHovering) =>
            _setMovement(MovementIndex.thirdProject, isHovering),
        image: 'assets/images/learn.png',
        columnDirection: -1,
        projectName: 'PROJECT 3',
        projectDiscription: 'Using animation to make the learning fun',
        projectTools: 'rive,shared_preferences,get_it,animated_text_kit',
        projectLink: 'https://github.com/SanaAltarabishi/animation_app.git',
        projectMoved: _movementList[MovementIndex.thirdProject.index],
      ),
      ProjectRow(
        keyName: 'project4',
        imageDirection: -1,
        moveFirstProImage: (isHovering) =>
            _setMovement(MovementIndex.fourthProject, isHovering),
        image: 'assets/images/lamp.png',
        columnDirection: 1,
        projectName: 'Project 4',
        projectDiscription:
            'Designed to simulate the interaction of turning a lamp on or off',
        projectTools: 'only flutter widget',
        projectLink: 'https://github.com/SanaAltarabishi/animated_Lamp.git',
        projectMoved: _movementList[MovementIndex.fourthProject.index],
      ),
      ProjectRow(
        keyName: 'fifthProject',
        imageDirection: 1,
        moveFirstProImage: (isHovering) =>
            _setMovement(MovementIndex.fifthProject, isHovering),
        image: 'assets/images/therp.png',
        columnDirection: -1,
        projectName: 'Project 5',
        projectDiscription:
            'An all-in-one app designed to enhance your daily life',
        projectTools:
            'shared_preferences,get_it,flutter_animate,page_transition,animated_text_kit,flutter_bloc,...',
        projectLink: 'https://github.com/SanaAltarabishi/therp_app.git',
        projectMoved: _movementList[MovementIndex.fifthProject.index],
      ),
    ];
    return Scaffold(
      backgroundColor: const Color(0xff131635),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            backgroundColor: const Color(0xff131635),
            shadowColor: Colors.grey[10], // Color(0xff464780),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "S",
                    style: GoogleFonts.alegreyaSc(
                      textStyle: const TextStyle(
                        color: Color(0xff4f96d2),
                        fontWeight: FontWeight.w400,
                        fontSize: 50,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _scrollToKey(stackSliverKey, 0);
                    },
                    child: AppBarText(
                      selectedIndex: _selectedIndex,
                      index: 0,
                      buttonText: 'HOME',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _scrollToKey(aboutMeKey, 1);
                    },
                    child: AppBarText(
                      index: 1,
                      selectedIndex: _selectedIndex,
                      buttonText: 'ABOUT ME',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _scrollToKey(protofolioKey, 2);
                    },
                    child: AppBarText(
                      index: 2,
                      selectedIndex: _selectedIndex,
                      buttonText: 'PROTFOLIO',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _scrollToKey(experiencesKey, 3);
                    },
                    child: AppBarText(
                      index: 3,
                      selectedIndex: _selectedIndex,
                      buttonText: 'SERVICES',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _scrollToKey(contactKay, 4);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff3c28b5),
                            Color(0xff3c28b5),
                            Color(0xff4f96d2),
                          ],
                        ),
                      ),
                      child: AppBarText(
                        index: 4,
                        selectedIndex: _selectedIndex,
                        buttonText: 'CONTACT',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: VisibilityDetector(
              key: stackSliverKey,
              onVisibilityChanged: (info) {
                if (info.visibleFraction == 0) {
                  _setVisibilit(VisibilityIndex.stack, false);
                  setState(() {
                    _selectedIndex = -1;
                  });
                } else {
                  _setVisibilit(VisibilityIndex.stack, true);
                  setState(() {
                    _selectedIndex = 0;
                  });
                  //  _setStackVisible(true);
                }
              },
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                    transform: Matrix4.translationValues(
                      //_isStackVisible
                      _visibilityList[VisibilityIndex.stack.index]
                          ? 0
                          : MediaQuery.sizeOf(context).width,
                      0,
                      0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 350),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _buildSlantedText(),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                    transform: Matrix4.translationValues(
                        _visibilityList[VisibilityIndex.stack.index]
                            ? 0
                            : -MediaQuery.sizeOf(context).width,
                        0,
                        0),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: HomeColumnContent(),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
            ),
          ),
          SliverToBoxAdapter(
            child: VisibilityDetector(
              key: aboutMeKey,
              onVisibilityChanged: (info) {
                if (info.visibleFraction == 0) {
                  _setVisibilit(VisibilityIndex.row, false);
                  setState(() {
                    _selectedIndex = -1;
                  });
                } else {
                  _setVisibilit(VisibilityIndex.row, true);
                  setState(() {
                    _selectedIndex = 1;
                  });
                }
              },
              child: AnimatedOpacity(
                opacity: _visibilityList[VisibilityIndex.stack.index] ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutQuint,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 350,
                      width: 450,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 65,
                            child: Container(
                              margin: const EdgeInsets.only(left: 50),
                              width: 300,
                              height: 250,
                              decoration: const BoxDecoration(
                                color: Color(0xff131635),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                            left: _isMoved ? 80 : 115,
                            top: _isMoved ? 20 : 0,
                            duration: const Duration(seconds: 1),
                            child: MouseRegion(
                              onEnter: (_) => _moveContainer(true),
                              onExit: (_) => _moveContainer(false),
                              child: Container(
                                width: 300,
                                height: 250,
                                decoration: const BoxDecoration(
                                  color: Color(0xffcdc4c3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Center(
                                  child: Lottie.asset('assets/animation.json'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AboutMeContent(screenWidth: screenWidth)
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
          SliverToBoxAdapter(
            child: VisibilityDetector(
              key: protofolioKey,
              onVisibilityChanged: (info) {
                if (info.visibleFraction == 0) {
                  _setVisibilit(VisibilityIndex.protofolioTitle, false);
                  setState(() {
                    _selectedIndex = -1;
                  });
                } else {
                  _setVisibilit(VisibilityIndex.protofolioTitle, true);
                  setState(() {
                    _selectedIndex = 2;
                  });
                }
              },
              child: AnimatedOpacity(
                opacity: _visibilityList[VisibilityIndex.protofolioTitle.index]
                    ? 1
                    : 0,
                duration: Duration(milliseconds: 500),
                child: Center(
                  child: Text(
                    'PROTFOLIO',
                    style: GoogleFonts.alegreyaSc(
                      textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffcdc4c3),
                        // shadows: [Shadow(color: Color(0xff4f96d2),blurRadius: 2,offset: Offset(7, 5))]
                      ),
                    ),
                  ),
                ),
              ).animate(
                onComplete: (controller) {
                  if (_visibilityList[VisibilityIndex.protofolioTitle.index]) {
                    controller.repeat();
                  }
                },
              ).shimmer(
                colors: [
                  const Color(0xff3c28b5).withOpacity(0.4),
                  const Color(0xff3c28b5).withOpacity(0.6),
                  const Color(0xff4f96d2).withOpacity(0.8),
                  Colors.white.withOpacity(0.2),
                ],
                duration: 5.seconds,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: projects.length,
              // addAutomaticKeepAlives: false,
              //?! qs : the repeate of print ....
              (context, index) {
                final project = projects[index];
                print('$index');
                return ProjectRowWidget(
                  onVisibilityChanged: _setVisibilit,
                  isVisible:
                      _visibilityList[VisibilityIndex.values[index + 3].index],
                  ind: VisibilityIndex.values[index + 3],
                  project: project,
                  index: index,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: VisibilityDetector(
              key: experiencesKey,
              onVisibilityChanged: (info) {
                if (info.visibleFraction == 0) {
                  _setVisibilit(VisibilityIndex.experiences, false);
                  setState(() {
                    _selectedIndex = -1;
                  });
                } else {
                  _setVisibilit(VisibilityIndex.experiences, true);
                  setState(() {
                    _selectedIndex = 3;
                  });
                }
              },
              child: AnimatedOpacity(
                opacity:
                    _visibilityList[VisibilityIndex.experiences.index] ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Text(
                    'EXPERIENCE',
                    style: GoogleFonts.alegreyaSc(
                      textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffcdc4c3),
                        // shadows: [Shadow(color: Color(0xff4f96d2),blurRadius: 2,offset: Offset(7, 5))]
                      ),
                    ),
                  ),
                ),
              ).animate(
                onComplete: (controller) {
                  if (_visibilityList[VisibilityIndex.experiences.index]) {
                    controller.repeat();
                  }
                },
              ).shimmer(
                colors: [
                  const Color(0xff3c28b5).withOpacity(0.4),
                  const Color(0xff3c28b5).withOpacity(0.6),
                  const Color(0xff4f96d2).withOpacity(0.8),
                  Colors.white.withOpacity(0.2),
                ],
                duration: 5.seconds,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: VisibilityDetector(
              key: const Key('experiencesRow'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction == 0) {
                  _setVisibilit(VisibilityIndex.experiencesRow, false);
                  setState(() {
                    _selectedIndex = -1;
                  });
                } else {
                  _setVisibilit(VisibilityIndex.experiencesRow, true);
                  setState(() {
                    _selectedIndex = 3;
                  });
                }
              },
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 500,
                ),
                transform: Matrix4.translationValues(
                  0,
                  _visibilityList[VisibilityIndex.experiencesRow.index]
                      ? 0
                      : 100,
                  0,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: ExperiencesRow(),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
            ),
          ),
          SliverToBoxAdapter(
            child: VisibilityDetector(
              key: contactKay,
              onVisibilityChanged: (info) {
                if (info.visibleFraction == 0) {
                  _setVisibilit(VisibilityIndex.contactContainer, false);
                } else {
                  _setVisibilit(VisibilityIndex.contactContainer, true);
                  setState(() {
                    _selectedIndex = 4;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                transform: Matrix4.translationValues(
                    0,
                    _visibilityList[VisibilityIndex.contactContainer.index]
                        ? 0
                        : screenHeight,
                    0),
                child: const ContactWidget(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//TODO: move this to over file :

class HalfCirclePainter extends CustomPainter {
  final bool isLeft;
  final Color color;

  HalfCirclePainter({required this.isLeft, this.color = Colors.blue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final startAngle = isLeft ? -3.14 / 2 : 3.14 / 2;
    final sweepAngle = 3.14;

    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class HalfCircleWidget extends StatelessWidget {
  final bool isLeft;
  final Color color;
  final double width;
  final double height;

  HalfCircleWidget({
    this.isLeft = true,
    this.color = Colors.blue,
    this.width = 200,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: HalfCirclePainter(
          isLeft: isLeft,
          color: color,
        ),
      ),
    );
  }
}
