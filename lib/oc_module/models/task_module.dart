class Tasks {
  String title;
  String? description;
  String startdate;
  String enddate;
  String id;
  String? uplaodlink;
  
  Tasks({
    required this.title,
    this.description,
    required this.startdate,
    required this.enddate,
    required this.id,
    this.uplaodlink

  });
}