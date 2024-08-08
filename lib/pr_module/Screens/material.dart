import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({super.key});

  @override
  _MaterialScreenState createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  TextEditingController searchController = TextEditingController();
  List<Lesson> lessons = [
    Lesson(
      lessonName: 'Lesson 1',
      description: 'Rational Numbers assignment, Very important for your next exam...',
      date: '18 Sep',
      fileName: '115_Attacking_LDAP_Based_Implementations.pdf',
    ),
    Lesson(
      lessonName: 'Lesson 2',
      description: 'Whole Numbers, Fraction, Decimals, Percentage, Ratio, Time, Measurement, Geometry, Data Analysis, Algebra, Speed ...',
      date: '15 Nov',
      fileName: 'CYBER SECURITY ITI 9 MONTHS.pdf',
    ),
  ];
  List<Lesson> filteredLessons = [];

  @override
  void initState() {
    super.initState();
    filteredLessons = lessons;
    searchController.addListener(() {
      filterLessons();
    });
  }

  void filterLessons() {
    List<Lesson> tempList = [];
    String query = searchController.text.toLowerCase();
    tempList.addAll(lessons.where((lesson) {
      bool nameMatches = lesson.lessonName.toLowerCase().contains(query);
      bool dateMatches = lesson.date.toLowerCase().contains(query) || _matchesDate(lesson.date, query);
      return nameMatches || dateMatches;
    }));

    setState(() {
      filteredLessons = tempList;
    });
  }

  bool _matchesDate(String date, String query) {
    try {
      DateFormat format = DateFormat('d MMM');
      DateTime lessonDate = format.parse(date);
      DateTime? queryDate;
      List<DateFormat> formats = [
        DateFormat('d/M'),
        DateFormat('d MMM'),
        DateFormat('d MMMM'),
      ];

      for (DateFormat fmt in formats) {
        try {
          queryDate = fmt.parse(query);
          // ignore: unnecessary_null_comparison
          if (queryDate != null) break;
        } catch (_) {}
      }

      if (queryDate != null) {
        return lessonDate.day == queryDate.day && lessonDate.month == queryDate.month;
      }
    } catch (_) {}

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.green),
              hintText: 'Search with Lesson Name or Date',
              filled: true,
              fillColor: Color.fromARGB(176, 179, 176, 176),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0.0),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredLessons.length,
            itemBuilder: (context, index) {
              return LessonCard(
                lesson: filteredLessons[index],
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.5,
                        minChildSize: 0.3,
                        maxChildSize: 0.9,
                        expand: false,
                        builder: (context, scrollController) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    filteredLessons[index].lessonName,
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    filteredLessons[index].description,
                                    style: const TextStyle(fontSize: 18.0),
                                  ),
                                  const SizedBox(height: 20.0),
                                  const Text(
                                    'Attachments',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  ListTile(
                                    leading: const Icon(Icons.download, color: Colors.green),
                                    title: Text(filteredLessons[index].fileName),
                                    onTap: () {
                                      // Handle the download action
                                    },
                                  ),
                                  const SizedBox(height: 20.0),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class Lesson {
  final String lessonName;
  final String description;
  final String date;
  final String fileName;

  Lesson({
    required this.lessonName,
    required this.description,
    required this.date,
    required this.fileName,
  });
}

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final VoidCallback onTap;

  const LessonCard({super.key, required this.lesson, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(11.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 193, 205, 193),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.green),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                lesson.lessonName,
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5.0),
              Text(
                lesson.description.length > 60
                    ? '${lesson.description.substring(0, 60)}...'
                    : lesson.description,
                style: const TextStyle(fontSize: 16.0),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10.0),
              Text(
                lesson.date,
                style: const TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  const Icon(Icons.attach_file, color: Colors.green),
                  const SizedBox(width: 5.0),
                  Flexible(
                    child: Text(
                      lesson.fileName,
                      style: const TextStyle(fontSize: 14.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}