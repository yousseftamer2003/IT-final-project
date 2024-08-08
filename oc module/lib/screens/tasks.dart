import 'package:flutter/material.dart';
import 'package:project_oc_committe/modules/task_module.dart';
import 'package:project_oc_committe/widgets/TextBox.dart';


class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded( //expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width, // to make width 100% of the screen
          alignment: Alignment.topLeft,
          padding:  const EdgeInsets.all(15),
          child:   Column(
            children: [
            TaskBox(data: Tasks(id: '1',title: 'Task 1',startdate: '1/1/2024',enddate: '31/12/2024',description: 'اي رزع',uplaodlink: 'https://gs.alexu.edu.eg/FCDS/index.php')),
            TaskBox(data: Tasks(id: '2',title: 'Task 2',startdate: '1/1/2025',enddate: '31/12/2025')),
            ]
          ),
        ),
      ),
      );
    
  }
}