import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/roadmapstep.dart';
import 'package:hacker_rank_final/it_module/widgets/roadmapwidgets/RoadmapItemWidget.dart';





class RoadmapStepWidget extends StatelessWidget {
  final RoadmapStepData step;

  RoadmapStepWidget({required this.step});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 8,
                backgroundColor: Color.fromARGB(255, 38, 78, 42),
              ),
              Container(
                width: 2,
                height: 50,
                color: Colors.green,
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...step.items.map((item) => RoadmapItemWidget(item: item)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}