import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/roadmapsection.dart';
import 'package:hacker_rank_final/it_module/widgets/roadmapwidgets/RoadmapSectionWidget.dart';







class RoadmapScreen extends StatelessWidget {
  final RoadmapSection sectiontitle;

  const RoadmapScreen({super.key, required this.sectiontitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Padding(
          padding:  EdgeInsets.only(top: 40,bottom: 30),
          child:  Text(sectiontitle.category),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
children: [ 
Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: SizedBox(
            width: 300,
            height: 200,
            child: Stack(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(.06), BlendMode.srcATop),
                  child: Image.asset(
                    sectiontitle.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
  
  
  ]  )) )  ),
  ...sectiontitle.sectionTitle
              .map((Section) => RoadmapSectionWidget( section: Section,))
              .toList()],
         
           
        ),
      ),
    );
  }
}












