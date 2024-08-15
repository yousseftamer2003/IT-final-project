import 'package:flutter/material.dart';
import 'package:project_oc_committe/modules/Event.dart';

class CalendarEvents extends ChangeNotifier {
  // We will initialize old events with API when it is ready
  Map<DateTime, List<Event>> events = {
    DateTime.utc(2024, 6, 20): [
      Event(
          description: "",
          location: "",
          startDate: DateTime.utc(2024, 6, 20),
          title: "title",
          endDate: DateTime.utc(2024, 6, 20),
          from: "5:00",
          to: "7:00",
          ),
      Event(
          description: "",
          location: "",
          startDate: DateTime.utc(2024, 6, 20),
          title: "title",
          endDate: DateTime.utc(2024, 6, 20),
          from: "5:00",
          to: "7:00",
          ),
      Event(
          description: "",
          location: "",
          startDate: DateTime.utc(2024, 6, 20),
          title: "title",
          endDate: DateTime.utc(2024, 6, 20),
          from: "5:00",
          to: "7:00",
          ),
      Event(
          description: "",
          location: "",
          startDate: DateTime.utc(2024, 6, 20),
          title: "title",
          endDate: DateTime.utc(2024, 6, 20),
          from: "5:00",
          to: "7:00",
          ),
      Event(
          description: "",
          location: "",
          startDate: DateTime.utc(2024, 6, 20),
          title: "title",
          endDate: DateTime.utc(2024, 6, 20),
          from: "5:00",
          to: "7:00",
          ),
      Event(
          description: "",
          location: "",
          startDate: DateTime.utc(2024, 6, 20),
          title: "title",
          endDate: DateTime.utc(2024, 6, 20),
          from: "5:00",
          to: "7:00",
          ),
      Event(
          description: "",
          location: "",
          startDate: DateTime.utc(2024, 6, 20),
          title: "title",
          endDate: DateTime.utc(2024, 6, 20),
          from: "5:00",
          to: "7:00",
          ),
      
    ],
  };

  // default selected day is the current day
  DateTime selectedDay = DateTime.now();


  void addEvent(DateTime date, Event data) {
    // If we found that day before
    if (events.containsKey(date)) {
      events[date]?.add(data);
    } else {
      events[date] = [data];
    }
    notifyListeners();
  }
}
