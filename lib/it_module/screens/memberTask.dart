import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/widgets/Taskwidgets/Assignment_card.dart';


//; To get the correct file path

class MemberTaskScreen extends StatefulWidget {
  const MemberTaskScreen({super.key});

  @override
  MemberTaskScreenState createState() => MemberTaskScreenState();
}

class MemberTaskScreenState extends State<MemberTaskScreen> {
  TextEditingController searchController = TextEditingController();
  bool showSubmittedOnly = false;
  List<AssignmentCard> assignments = [
    const AssignmentCard(
      title: 'Assignment 1',
      subject: 'Maths',
      description: 'Rational Numbers assignment, Very important for your next exam',
      dueDate: '18 Sep',
      initialDaysLeft: '',
      initiallySubmitted: true,
      initialFiles: ['file1.jpg'],
    ),
    const AssignmentCard(
      title: 'Assignment 2',
      subject: 'Maths',
      description: 'Whole Numbers, Fraction, Decimals, Percentage, Ratio, Time, Measurement, Geometry, Data Analysis, Algebra, Speed',
      dueDate: '18 Sep',
      initialDaysLeft: '1 Day Left',
      initiallySubmitted: false,
      initialFiles:[],
    ),
    const AssignmentCard(
      title: 'Assignment 3',
      subject: 'Science',
      description: 'Crop Production & Mgt. Very important for your next exam',
      dueDate: '20 Sep',
      initialDaysLeft: '4 Days Left',
      initiallySubmitted: false,
      initialFiles: [],
    ),
  ];

  List<AssignmentCard> filteredAssignments = [];

  @override
  void initState() {
    super.initState();
    filteredAssignments = assignments;
    searchController.addListener(() {
      filterAssignments();
    });
  }
  

  void filterAssignments() {
    List<AssignmentCard> assignments = [];
    assignments.addAll(assignments);
    if (searchController.text.isNotEmpty) {
      assignments.retainWhere((assignment) {
        String searchTerm = searchController.text.toLowerCase();
        String assignmentTitle = assignment.title.toLowerCase();
        return assignmentTitle.contains(searchTerm);
      });
    }
    if (showSubmittedOnly) {
      assignments.retainWhere((assignment) => assignment.initiallySubmitted);
    }
    setState(() {
      filteredAssignments = assignments;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBar(
              controller: searchController,
              showSubmittedOnly: showSubmittedOnly,
              onToggleSubmitted: (value) {
                setState(() {
                  showSubmittedOnly = value;
                  filterAssignments();
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredAssignments.length,
                itemBuilder: (context, index) {
                  return filteredAssignments[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final bool showSubmittedOnly;
  final ValueChanged<bool> onToggleSubmitted;

 SearchBar({
    required this.controller,
    required this.showSubmittedOnly,
    required this.onToggleSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Search Task',
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.green,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 237, 235, 235),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const SizedBox(width: 8),
        Row(
          children: [
            const Text(
              'Submitted',
              style: TextStyle(color: Colors.black),
            ),
            Switch(
              activeColor: const Color.fromARGB(255, 19, 84, 22),
              value: showSubmittedOnly,
              onChanged: onToggleSubmitted,
            ),
          ],
        ),
      ],
    );
  }
}
