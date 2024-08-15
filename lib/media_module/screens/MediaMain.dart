import 'package:flutter/material.dart';
import 'package:hacker_rank_final/media_module/Widgets/side_drawer.dart';
import 'package:hacker_rank_final/media_module/screens/events_screen.dart';
import 'package:hacker_rank_final/media_module/screens/materials_screen%20admin.dart';
import 'package:hacker_rank_final/media_module/screens/membersscreen.dart';
import 'package:hacker_rank_final/media_module/screens/social_media.dart';
import 'package:hacker_rank_final/media_module/screens/tasks_screen%20admin.dart';


void main() {
  runApp(const MaterialApp(home: MediaMain()));
}

class MediaMain extends StatelessWidget {
  const MediaMain({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Media Committee'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          bottom: const TabBar(
             indicatorColor:  Color.fromARGB(255, 6, 61, 12), // Color of the indicator line
           
            tabs: [
              Tab(text: 'Materials'),
              Tab(text: 'Tasks'),
              Tab(text: 'Events'),
              Tab(text: 'Social Media'),
              Tab(text:'Memebers' ,)
            ],
          ),
        ),
        drawer: SideDrawer(), // Use the SideDrawer widget
        body:  TabBarView(
          children: [
            MaterialsScreen(), // Use the MaterialsScreen widget
            TasksScreen(), // Use the TasksScreen widget
            EventsScreen(isAdmin: true,), // Use the EventsScreen widget
           Socialmediascreen(),
            MembersScreen(isAdmin: true,)// Use the MembersScreen widget
          ],
        ),
      ),
    );
  }
}
