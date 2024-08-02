import 'package:hacker_rank_final/it_module/models/roadmapmodel/section.dart';


class RoadmapSection {
  final String image;
  final String category;
  final List<Section> sectionTitle;
 

  RoadmapSection( {
    required this.image,
    required this.sectionTitle,
   
    required this.category
  });
}
