// Yahya Mahmoud
// To render different secions (material, tasks, events, members)

import 'package:flutter/material.dart';
import 'package:hacker_rank_final/oc_module/screens/events.dart';
import 'package:hacker_rank_final/oc_module/screens/ideas.dart';
import 'package:hacker_rank_final/oc_module/screens/materials.dart';
import 'package:hacker_rank_final/oc_module/screens/members.dart';
import 'package:hacker_rank_final/oc_module/screens/tasks.dart';
import 'package:hacker_rank_final/oc_module/services/toggleSections.dart';

import 'package:provider/provider.dart';

class RenderSection extends StatelessWidget {
  const RenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<toggleSections>(builder: (context, value, child) {
      switch (value.activeSection) {
        case "Materials":
          return const MaterialScreen();
        case "Tasks":
          return const TaskScreen();
        case "Events":
          return const Events();
        case "Ideas":
          return const Ideas();
        case "Members":
          return const Members();
        default:
          return const Text("Loading...");
      }
    });
  }
}
