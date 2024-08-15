// Yahya Mahmoud
// This widget repesents a title in members section (head or vice head or members)

import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';

class MembersListTitles extends StatelessWidget {
  const MembersListTitles({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: mainGreen, width: 1.5)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: mainGreen, fontSize: 23),
      ),
    );
  }
}
