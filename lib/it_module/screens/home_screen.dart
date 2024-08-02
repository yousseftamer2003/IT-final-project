import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/screens/AdminTaskscreen.dart';
import 'package:hacker_rank_final/it_module/screens/Feildscard.dart';
import 'package:hacker_rank_final/it_module/screens/material.dart';
import 'package:hacker_rank_final/it_module/screens/member.dart';
import 'package:hacker_rank_final/it_module/screens/memberTask.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final bool isAdmin = true;
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
              labelColor: Color.fromARGB(255, 111, 161, 113),
              dividerColor: Colors.green,
              isScrollable: true,
              indicatorColor: Color.fromARGB(255, 34, 77, 36),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text(
                    "Members",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                ),
                Tab(
                  child: Text(
                    "Tasks",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                ),
                Tab(
                  child: Text(
                    "Materials",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                ),
                Tab(
                  child: Text("Raod maps",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w400)),
                ),
              ]),
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(40),
            child: Text(
              "IT committee",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              SizedBox(
                height: double.infinity,
                child: TeamPage(),
              ),
              SizedBox(
                height: double.infinity,
                child: isAdmin? const TaskScreen(): MemberTaskScreen(),
              ),
              const SizedBox(
                height: double.infinity,
                child: MaterialScreen(),
              ),
              const SizedBox(
                height: double.infinity,
                child: FieldsCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
