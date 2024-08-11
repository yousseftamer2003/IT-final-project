import 'package:flutter/material.dart';
import 'package:media/Models/EventItem.dart';


class EventItem extends StatelessWidget {
  final EventModel eventModel;

  const EventItem({Key? key, required this.eventModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(255, 150, 234, 158),
      child: ListTile(
        leading: Image.network(eventModel.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(eventModel.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.black),
                SizedBox(width: 5),
                Text(eventModel.date),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.black),
                SizedBox(width: 5),
                Text(eventModel.location),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
