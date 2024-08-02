import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/Linkdata.dart';



import 'package:url_launcher/url_launcher.dart';

class ListTitle extends StatelessWidget {
  final LinkData t;
  ListTitle({required this.t});

  Future<void> _fetchData() async {
    var dio = Dio();
    try {
      var response = await dio.get(t.url);
      print('Response data: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(t.url);
    if (!await launchUrl(url)) {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ScrollNotificationObserver(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              ListTile(
                selectedColor: Colors.green,
                  title: TextButton(
                    onPressed: () async {
                      await _fetchData();
                      _launchURL();
                    },
                    child: Text(t.title),
                  ),
                ),
            
              ]    ),
          
      
      ),
    );
  }
}

