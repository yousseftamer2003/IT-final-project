// Yahya Mahmoud

import 'package:flutter/material.dart';
import 'package:project_oc_committe/widgets/menuButton.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 51,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Button(
            text: "Materials",
          ),
          Button(
            text: "Tasks",
          ),
          Button(
            text: "Events",
          ),
          Button(
            text: "Ideas",
          ),
          Button(
            text: "Members",
          ),
        ],
      ),
    );
  }
}
