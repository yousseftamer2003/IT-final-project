import 'package:flutter/material.dart';
import 'package:hacker_rank_final/widgets/grid_container.dart';

class CommitteesScreen extends StatelessWidget {
  const CommitteesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> committeesNames = ['IT', 'PR', 'OC', 'SC', 'HR', 'Media'];
    List<String> committeesImages = [
      'assets/itimage.jpg',
      'assets/itimage.jpg',
      'assets/itimage.jpg',
      'assets/itimage.jpg',
      'assets/itimage.jpg',
      'assets/itimage.jpg'
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 280, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: const DecorationImage(
                  image: AssetImage('assets/hackerranklogo.jpg'),
                  fit: BoxFit.cover, 
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: committeesNames.length,
                itemBuilder: (context, index) {
                  return GridContainer(
                    text: committeesNames[index],
                    image: committeesImages[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}