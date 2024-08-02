import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/subtitles.dart';
import 'package:hacker_rank_final/it_module/widgets/roadmapwidgets/ListTitle.dart';


class SheetContent extends StatelessWidget {
 
  final Subtitle s;

 SheetContent({
     required this.s,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ScrollNotificationObserver(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            ExpansionTile(
              title: Text(s.subtitles),
              children: s.links.map((e) => ListTitle(t: e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}