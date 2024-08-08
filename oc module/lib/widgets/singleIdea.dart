import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';
import 'package:project_oc_committe/modules/idea.dart';
import 'package:project_oc_committe/widgets/ListTitles.dart';

class SingleIdea extends StatelessWidget {
  const SingleIdea({super.key, required this.data});
  final Idea data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leadingWidth: 65,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // go to previous screen
                    try {
                      Navigator.of(context).pop();
                    } catch (e) {
                      // in case of there are no previous screens
                      log("No previous Screens");
                    }
                  },
                  icon: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(6, 137, 50, 0.4),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: mainGreen,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text(
              "OC Committe",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
        body:Center (
         child:Column(
          children:[
            const SizedBox(height: 15,),
            const ListTitle(text: 'title'),
            const SizedBox(height: 15,),
         Text(data.title,
        style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
        const SizedBox(height: 20,),
         const ListTitle(text: 'describtion'),
         const SizedBox(height: 15,),
         Text(data.description.isNotEmpty ? data.description : 'No describition',
        style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      ])
      ),
    )
  );
  }
}
