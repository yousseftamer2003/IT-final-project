// ignore_for_file: file_names, camel_case_types, prefer_const_constructors_in_immutables
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';
import 'package:project_oc_committe/modules/matrials_module.dart';
import 'package:project_oc_committe/widgets/ListTitles.dart';
import 'package:url_launcher/url_launcher.dart';



class singleMaterial extends StatelessWidget {
   singleMaterial({super.key, required this.data,});
  final Materials data;

 Future<dynamic> _launchUrl(String urlString) async {
    final Uri url = await Uri.parse(urlString);
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
         Text(data.description!=null ? '${data.description}' : 'No describition',
        style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        if(data.videolink!=null)
        const SizedBox(height: 25,),
        Column(children:[
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: mainGreen),
          onPressed: () async {
                  await _launchUrl(
                    data.videolink!=null ? '${data.videolink}' : '');
                },
                child: const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child:  Text('Open Video Link',style: TextStyle(color: mainWhite)),
                )),
                 ]
      
              ),
              const SizedBox(height: 20,),
      if(data.pdfLink!=null)
        Column(children:[
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: mainGreen),
          onPressed: () async {
                  await _launchUrl(data.videolink!=null ? '${data.pdfLink}' : '');
                },
                 child: const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 26),
                  child:  Text('Open PDf Link',style: TextStyle(color: mainWhite)),
                )),
      ]
      )
      ])
      ),
    )
  );}
}