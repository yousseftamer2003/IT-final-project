import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/roadmapitem.dart';
import 'package:hacker_rank_final/it_module/widgets/roadmapwidgets/sheetcontent.dart';


class BottomSheetContent extends StatelessWidget {
  final RoadmapItem item;



   const BottomSheetContent({super.key, 
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
       ...item.subtitle.map((e) => SheetContent(s: e)),
        ],
      ),
    );
  }
}