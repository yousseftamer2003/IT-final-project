import 'package:flutter/material.dart';
import 'package:hacker_rank_final/media_module/Models/EventItem.dart';


class EventItem extends StatelessWidget {
  final EventModel eventModel;

  const EventItem({Key? key, required this.eventModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 150, 234, 158),
      child: ListTile(
        leading: Image.network(eventModel.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(eventModel.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.black),
                const SizedBox(width: 5),
                Text(eventModel.date),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.black),
                const SizedBox(width: 5),
                Text(eventModel.location),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
