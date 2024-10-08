import 'package:flutter/material.dart';
import 'package:hacker_rank_final/pr_module/Screens/AdminTaskscreen.dart';
import 'package:hacker_rank_final/pr_module/Screens/Deals.dart';
import 'package:hacker_rank_final/pr_module/Screens/material.dart';
import 'package:hacker_rank_final/pr_module/Screens/member.dart';
import 'package:hacker_rank_final/pr_module/Screens/memberTask.dart';




class HomePrScreen extends StatelessWidget {
  const HomePrScreen({super.key});
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
                  child: Text("Deals",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w400)),
                ),
              ]),
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(40),
            child: Text(
              "Pr committee",
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
                child: isAdmin? const TaskScreen():MemberTaskScreen(),
              ),
              const SizedBox(
                height: double.infinity,
                child: MaterialScreen(),
              ),
              SizedBox(
                height: double.infinity,
                child:  Deals(isAdmin:isAdmin ,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
