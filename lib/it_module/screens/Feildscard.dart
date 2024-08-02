import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/data/roadmap_data.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/roadmapsection.dart';
import 'package:hacker_rank_final/it_module/screens/roadmap.dart';





class FieldsCard extends StatelessWidget {
  const FieldsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
                children: roadmapsection
            .map((category) => CardDetails(
                  category: category,
                ))
            .toList(),
              ),
        ));
  }
}

class CardDetails extends StatelessWidget {
  final RoadmapSection category;
  const CardDetails({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RoadmapScreen(
                  sectiontitle: category,
                )));
      },
      child: Card(
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
                      Colors.grey.withOpacity(0.6), BlendMode.srcATop),
                  child: Image.asset(
                    category.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      category.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
