import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';
import 'package:project_oc_committe/modules/idea.dart';
import 'package:project_oc_committe/widgets/singleIdea.dart';

class IdeasList extends StatelessWidget {
  const IdeasList({super.key, required this.data});
  final List<Idea> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((e) => InkWell(
      onTap: () {
      showModalBottomSheet(
        context: context,
         builder: (BuildContext context){
          return  SingleIdea(data: e);
         }
         );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.star,
              color: mainGreen,
              size: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[850]),
                ),
                Text(e.description),
              ],
            ),
          ],
        ),
      ),
    )).toList(),
    );
  }
}
