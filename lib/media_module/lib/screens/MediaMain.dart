import 'package:flutter/material.dart';
import 'package:media/Widgets/side_drawer.dart'; // Import the SideDrawer file
import 'package:media/Screens/materials_screen.dart'; // Import the MaterialsScreen file
import 'package:media/Screens/tasks_screen.dart'; // Import the TasksScreen file
import 'package:media/Screens/events_screen.dart'; // Import the EventsScreen file
import 'package:media/screens/membersscreen.dart';
import 'package:media/screens/social_media.dart'; // Import the MembersScreen file

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
