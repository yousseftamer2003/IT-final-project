import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hacker_rank_final/media_module/Models/contentManagar.dart';


class Socialmediascreen extends StatefulWidget {
  const Socialmediascreen({super.key});

  @override
  State<Socialmediascreen> createState() => _SocialmediascreenState();
}

class _SocialmediascreenState extends State<Socialmediascreen> {
  final ContentManger contentManger = ContentManger();
  final TextEditingController linkController = TextEditingController();

  Future<void> addNewPost() async {
    final link = linkController.text;
    try {
      contentManger.addLinkContent(link);
      setState(() {});
    } catch (e) {
      log('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: linkController,
              decoration: const InputDecoration(
                labelText: 'Enter link',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
