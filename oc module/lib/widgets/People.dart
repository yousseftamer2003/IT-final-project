// Yahya Mahmoud
// This widget loads some members from list under specific title(head-vice head- member)

import 'package:flutter/material.dart';
import 'package:project_oc_committe/widgets/Person.dart';

class People extends StatelessWidget {
  const People({super.key, required this.people});
  final List people;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topLeft,
      child: Column(
        children: people
            .map((e) => Person(data: e))
            .toList(),
      ),
    );
  }
}
