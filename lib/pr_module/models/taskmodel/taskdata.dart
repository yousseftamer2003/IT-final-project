class Task {
  String name;
  DateTime dueDate;
  String details;
  int Degree;
  List<MemberSubmission> submissions;

  Task({
    required this.name,
    required this.dueDate,
    required this.details,
    required this.Degree,
    this.submissions = const [],
  });
}

class MemberSubmission {
  String memberId;
  String memberName; // Add member name
  String filePath;
  String comments;
  int degree;
  DateTime submissionDate;

  MemberSubmission({
    required this.memberId,
    required this.memberName, // Initialize member name
    required this.filePath,
    this.comments = '',
    this.degree = 0,
    required this.submissionDate,
  });
}

