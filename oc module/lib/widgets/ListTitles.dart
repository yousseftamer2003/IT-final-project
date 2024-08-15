import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({super.key,required this.text});
   final String text;

  @override
  Widget build(BuildContext context) {
        return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: mainGreen, width: 1.5)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: mainGreen, fontSize: 25,fontWeight: FontWeight.bold),
      ),
    );
  }
}