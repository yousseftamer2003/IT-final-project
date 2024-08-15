// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';
import 'package:project_oc_committe/modules/task_module.dart';
import 'package:project_oc_committe/widgets/ListTitles.dart';
import 'package:url_launcher/url_launcher.dart';



class SingleTask extends StatelessWidget {
   SingleTask({super.key, required this.data,});
  final Tasks data;

 Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

   // will contain all information (id-text-images-files-....)
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
        body: Center (
         child:Column(
          children: [
            const ListTitle(text: 'Title'),
            Text(data.title,
              style: const TextStyle(
                color: mainBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold
                )
            ),
            const SizedBox(height: 13,),
           
            const SizedBox(height: 10,)
            ,const ListTitle(text: 'Description'),
            const SizedBox(height: 10,),
            Text(data.description!=null ? '${data.description}': 'No description',
              style: const TextStyle(
                color: mainBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold
                )
            ),
            const SizedBox(height: 20,),
            if(data.uplaodlink!=null)
             Column(children:[
             ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: mainGreen),
                onPressed: () async {
                  await _launchUrl(data.uplaodlink!=null ? '${data.uplaodlink}' : '');
                },
                 child: const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 26),
                  child:  Text('Upload file Here',style: TextStyle(color: mainWhite)),
                ))]),
            const SizedBox(height: 30,),
            Row(
              children: [
                const SizedBox(width: 20,),
                const Text('Start date :'
                ,style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: mainGreen
                ),),
                const SizedBox(width: 10,),
                Text(data.startdate,
                style:const  TextStyle(
                  color: mainBlack,
                  fontSize: 16,
                  fontWeight:FontWeight.bold
                ),
                ),
                const SizedBox(width: 15,),
                const Text('End date :'
                ,style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: mainGreen
                ),),
                const SizedBox(width: 10,),
                Text(data.enddate,
                style:const  TextStyle(
                  color: mainBlack,
                  fontSize: 16,
                  fontWeight:FontWeight.bold
                ),
                ),
              ],
            ),
          ],
          )
      ),
    )
  );}
}