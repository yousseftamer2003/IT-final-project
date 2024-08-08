// Yahya Mahmoud

import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';
import 'package:project_oc_committe/services/toggleSections.dart';
import 'package:provider/provider.dart';

class Button extends StatefulWidget {
  const Button({super.key, required this.text});
  final String text;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      // to change section
      Provider.of<toggleSections>(context, listen: false).active(widget.text);
      
    }, child: Consumer<toggleSections>( // to know if it is active or not
      builder: (context, value,_) {
        return Container(
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 44,
                child: Text(
                  widget.text,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 120,
                height: value.activeSection == widget.text ? 6 : 0, // if active will show green bottom border
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6)),
                  shape: BoxShape.rectangle,
                  color: mainGreen,
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
