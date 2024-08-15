import 'package:flutter/material.dart';
import 'package:hacker_rank_final/oc_module/constants/colors.dart';
import 'package:hacker_rank_final/oc_module/services/calendar.dart';
import 'package:hacker_rank_final/oc_module/widgets/eventsList.dart';

import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarEvents>(builder: (context, value, child) {
      return Column(
        children: [
          TableCalendar(
            // to make range dynamic 5 years before current day and 5 years after it
            firstDay: DateTime.utc(DateTime.now().year - 5, 1, 1),
            lastDay: DateTime.utc(DateTime.now().year + 5, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.
              return isSameDay(value.selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(value.selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  value.selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },

            // to load events saved in provider, if there is no events will return empty list
            eventLoader: (day) {
              return value.events[day] ?? [];
            },

            // To customize UI and colors
            calendarBuilders: CalendarBuilders(
              // Customize current day (make background color green and shape as circle)
              todayBuilder: (context, day, focusedDay) {
                return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: mainGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    day.day.toString(), // to show number of the current day
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                );
              },
              selectedBuilder: (context, day, focusedDay) {
                return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: mainGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    day.day.toString(), // to show number of the current day
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),

          // shows comming events
          // I put it here to force it to rebuild it when the state of selected day change
          Text("Events on ${value.selectedDay.year}/${value.selectedDay.month}/${value.selectedDay.day}",style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const EventsList(),
        ],
      );
    });
  }
}
