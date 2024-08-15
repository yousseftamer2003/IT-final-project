// Yahya Mahmoud
// This widget repersents a single person in members section
import 'package:flutter/material.dart';
import 'package:project_oc_committe/widgets/Add%20Member.dart';

class Person extends StatelessWidget {
  const Person({super.key, required this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
              backgroundColor: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              data["name"],
              style: const TextStyle(fontSize: 17),
            ),
          ],),
          SizedBox(
            child: AddMember(add: false, data: data,),
          ),
          // AddMember(add: false, data: data,),
        ],
      ),
    );
  }
}
