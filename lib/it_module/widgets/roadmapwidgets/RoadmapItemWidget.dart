import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/roadmapitem.dart';
import 'package:hacker_rank_final/it_module/widgets/roadmapwidgets/Bottomsheetcontent.dart';



class RoadmapItemWidget extends StatefulWidget {
  final RoadmapItem item;
  RoadmapItemWidget({required this.item});

  @override
  _RoadmapItemWidgetState createState() => _RoadmapItemWidgetState();
}

class _RoadmapItemWidgetState extends State<RoadmapItemWidget> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });

        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Allows the bottom sheet to be scrollable
          builder: (context) => DraggableScrollableSheet(
            expand: false, // Allows the bottom sheet to be expanded by dragging
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: BottomSheetContent(item: widget.item),
              );
            },
          ),
        );
      },
      child: ListTile(
        title: Text(
          widget.item.title,
          style: TextStyle(
            color: _isTapped ? Colors.green : Colors.black,
          ),
        ),
      ),
    );
  }
}



