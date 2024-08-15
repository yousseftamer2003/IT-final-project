

import 'package:flutter/material.dart';
import 'package:hacker_rank_final/oc_module/widgets/Add%20Member.dart';
import 'package:hacker_rank_final/oc_module/widgets/MembersListTitles.dart';
import 'package:hacker_rank_final/oc_module/widgets/People.dart';

// import 'package:task_sec_3/constants/colors.dart';

class Members extends StatelessWidget {
  const Members({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width, // to make width 100% of the screen
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: const Column(
            children: [
              // add member for admin only
              Column(
                children: [
                  Text("Add new Person"),

                  AddMember(add: true, data: {
                    "name" : "",
                    "role" : "Member",
                    "year" : "First Year",
                  },),
                ],
              ),

              // title
              MembersListTitles(text: "Head"),
              // people who have this title
              People(people: [{"name": "Tamer Abbassy"}],),

              // title
              MembersListTitles(text: "Vice Head"),
              // people who have this title
              People(people: [{"name": "Abdel Fattah Elmixiky"}],),

              // title
              MembersListTitles(text: "Members"),
              // people who have this title
              People(people: [{"name": "Yahya"}, {"name": "Yahya"}, {"name": "Yahya"}, {"name": "Yahya"}, {"name": "Yahya"},{"name": "Yahya"}, {"name": "Yahya"}, {"name": "Yahya"}, {"name": "Yahya"}, {"name": "Yahya"},{"name": "Yahya"}, {"name": "Yahya"}, {"name": "Yahya"}, {"name": "Yahya"}, {"name": "Yahya"},{"name": "Yahya"}, {"name": "Yahya"}],),
            ],
          ),
        ),
      ),
    );
  }
}
