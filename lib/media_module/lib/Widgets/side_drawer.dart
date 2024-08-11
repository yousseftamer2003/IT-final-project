import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // Set background color to white
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Maram Allah',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 6, 61, 12)),
              ),
              accountEmail: Text(
                'Media Committee',
                style: TextStyle(fontWeight: FontWeight.bold, color:  Color.fromARGB(255, 6, 61, 12)),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile Picture.jpg"),
              ),
              decoration: BoxDecoration(
                color: Colors.white, // Set background color of header to white
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color:  Color.fromARGB(255, 6, 61, 12)), // Change icon color to green
              title: const Text(
                'Home',
                style: TextStyle(color:  Color.fromARGB(255, 6, 61, 12), fontWeight: FontWeight.bold),
              ), // Change text color to green
              onTap: () {
                Navigator.pop(context);
                // Refresh home page content
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color:  Color.fromARGB(255, 6, 61, 12)), // Change icon color to green
              title: const Text(
                'Profile',
                style: TextStyle(color:  Color.fromARGB(255, 6, 61, 12), fontWeight: FontWeight.bold),
              ), // Change text color to green
              onTap: () {
                Navigator.pop(context);
                // Refresh profile page content
              },
            ),
            ListTile(
              leading: const Icon(Icons.group, color:  Color.fromARGB(255, 6, 61, 12)), // Change icon color to green
              title: const Text(
                'Other Committees',
                style: TextStyle(color:  Color.fromARGB(255, 6, 61, 12), fontWeight: FontWeight.bold),
              ), // Change text color to green
              onTap: () {
                Navigator.pop(context);
                // Refresh settings page content
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color:  Color.fromARGB(255, 6, 61, 12)), // Change icon color to green
              title: const Text(
                'Settings',
                style: TextStyle(color:  Color.fromARGB(255, 6, 61, 12), fontWeight: FontWeight.bold),
              ), // Change text color to green
              onTap: () {
                Navigator.pop(context);
                // Refresh settings page content
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color:  Color.fromARGB(255, 6, 61, 12)), // Change icon color to green
              title: const Text(
                'Logout',
                style: TextStyle(color:  Color.fromARGB(255, 6, 61, 12), fontWeight: FontWeight.bold),
              ), // Change text color to green
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
