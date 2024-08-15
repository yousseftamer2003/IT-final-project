/// class to use in calendar.
class Event {
  String title;
  String description;
  String location;
  String from;
  String to;
  DateTime? startDate;
  DateTime? endDate;

  Event({
    required this.description,
    required this.location,
    required this.title,
    required this.from,
    required this.to,
    this.startDate,
    this.endDate,
  });
}
