import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';
import 'package:project_oc_committe/modules/task_module.dart';
import 'package:project_oc_committe/screens/SingleTask.dart';

class TaskBox extends StatelessWidget {
  const TaskBox({
    super.key,
    required this.data
  });
  final Tasks data; // to make user able to go to its single screen


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      showModalBottomSheet(
        context: context,
         builder: (BuildContext context){
          return SingleTask(data:data);
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
              Icons.quiz,
              color: mainGreen,
              size: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.id,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[850]),
                ),
                Text(data.startdate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
