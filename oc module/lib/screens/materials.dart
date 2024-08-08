// Yahya Mahmoud

/*
  We will get materials by API when it is ready
*/

import 'package:flutter/material.dart';
import 'package:project_oc_committe/modules/matrials_module.dart';
import 'package:project_oc_committe/widgets/MaterialBox.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded( //expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width, // to make width 100% of the screen
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child:  Column(
            children: [
              
                // We will get materials by API when it is ready to loop through it

                MaterialBox(data:Materials( id: '1', date: '27/11/2020', title: 'ماتريال 1',description: 'القاضيه ممكن',videolink:'https://youtu.be/4tV5NMUd5-0?si=Vfccspu7eOin_suv',pdfLink: 'https://pub.dev/')),
                MaterialBox(data:Materials( id: '2',date: '22/2/2024', title: 'ماتريال 2',description: '', videolink: 'https://www.youtube.com/watch?v=Sua3g0DBwv8&list=RDGMEM8rCiNo9r3kt8XsHUaTEI2gVM15VrKkUkcPw&index=5')),
                MaterialBox(data:Materials( id: '3',date: '22/2/2023', title: 'ماتريال 3',description: 'description tar4')),
                MaterialBox(data:Materials( id: '4',  date: '22/2/2022', title: 'ماتريال 4')),
              ],
          ),
        ),
      ),
    );
  }
}