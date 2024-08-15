import 'package:flutter/material.dart';
import 'package:hacker_rank_final/oc_module/models/idea.dart';
import 'package:hacker_rank_final/oc_module/widgets/Ideas.dart';
import 'package:hacker_rank_final/oc_module/widgets/IdeasForm.dart';


class Ideas extends StatelessWidget {
  const Ideas({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded( //expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
      child: SingleChildScrollView(
        child: Column(
          children: [

            // this data is temporary we will get it by API when ready
            IdeasList(data: [
              Idea(title: "go swimming", description: "ggggggggggggggg"),
              Idea(title: "go swimming", description: "ggggggggggggggg"),
              Idea(title: "go swimming", description: "ggggggggggggggg"),
              Idea(title: "go swimming", description: "ggggggggggggggg"),
              Idea(title: "go swimming", description: "ggggggggggggggg")
            ],),

            // this will be for specific users only
            IdeasForm(),
          ],
        ),
      ),
    );
  }
}