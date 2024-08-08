import 'package:flutter/material.dart';
import 'package:project_oc_committe/services/calendar.dart';
import 'package:project_oc_committe/widgets/eventBox.dart';
import 'package:provider/provider.dart';

class EventsList extends StatefulWidget {
  const EventsList({super.key});

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarEvents>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (value.events[DateTime.utc(value.selectedDay.year,
                      value.selectedDay.month, value.selectedDay.day)] ??
                  [])
              .map((e) {
            return EventBox(
              data: e,
            );
          }).toList(),
        );
      },
    );
  }
}
