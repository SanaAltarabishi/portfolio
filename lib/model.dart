class ProjectRow {
  String keyName;
 /// void Function(bool visible) setFirstProVisible;
 // bool isFirstProVisible;
  double imageDirection;
  void Function(bool isHovering) moveFirstProImage;
  String image;
  double columnDirection;
  String projectName;
  String projectDiscription;
  String projectTools;
  String projectLink;
  bool projectMoved;
  ProjectRow({
    required this.keyName,
    required this.imageDirection,
    required this.moveFirstProImage,
    required this.image,
    required this.columnDirection,
    required this.projectName,
    required this.projectDiscription,
    required this.projectTools,
    required this.projectLink,
    required this.projectMoved,
  });
}


enum VisibilityIndex {
  row,
  stack,
  protofolioTitle,
  firstProject,
  secondProject,
  thirdProject,
  fourthProject,
  fifthProject,
  experiences,
  experiencesRow,
  contactContainer,
}

enum MovementIndex {
  main,
  firstProject,
  secondProject,
  thirdProject,
  fourthProject,
  fifthProject,
}
