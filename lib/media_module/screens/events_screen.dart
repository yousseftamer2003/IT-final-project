import 'package:flutter/material.dart';
import 'package:hacker_rank_final/media_module/Models/CategryItem.dart';
import 'package:hacker_rank_final/media_module/Models/EventItem.dart';
import '../Widgets/categoryWidget.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsScreen extends StatefulWidget {
  final bool isAdmin;

  const EventsScreen({super.key, required this.isAdmin});

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final categories = [
    CategoryModel(icon: Icons.work, label: 'Workshops'),
    CategoryModel(icon: Icons.event, label: 'Seminars'),
    CategoryModel(icon: Icons.school, label: 'College'),
  ];

  List<EventModel> events = [
    EventModel(title: 'Workshop 1', date: '2024-07-20', location: 'Location 1', imageUrl: 'https://via.placeholder.com/150'),
    EventModel(title: 'Seminar 1', date: '2024-07-21', location: 'Location 2', imageUrl: 'https://via.placeholder.com/150'),
    EventModel(title: 'College Event 1', date: '2024-07-22', location: 'Location 3', imageUrl: 'https://via.placeholder.com/150'),
  ];

  Future<void> showEventDialog({EventModel? event, int? index}) async {
    final isEditing = event != null;
    final titleController = TextEditingController(text: isEditing ? event.title : '');
    final locationController = TextEditingController(text: isEditing ? event.location : '');

    // Set the selected day if editing an existing event
    if (isEditing) {
      _selectedDay = DateTime.parse(event.date);
    } else {
      _selectedDay = null; // Reset when adding a new event
    }

    await showDialog<EventModel>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(isEditing ? 'Edit Event' : 'Add Event'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: locationController,
                    decoration: const InputDecoration(labelText: 'Location'),
                  ),
                  const SizedBox(height: 16),
                  Text('Selected Date: ${_selectedDay?.toLocal().toString().split(' ')[0] ?? 'None'}'),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDay ?? DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _selectedDay = pickedDate;
                        });
                      }
                    },
                    child: const Text('Select Date', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: const Text('Cancel', style: TextStyle(color: Color.fromARGB(255, 30, 106, 32))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Save', style: TextStyle(color: Color.fromARGB(255, 30, 106, 32))),
                  onPressed: () {
                    if (titleController.text.isEmpty || locationController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a title and location.')),
                      );
                      return;
                    }
                    if (_selectedDay != null) {
                      final newEvent = EventModel(
                        title: titleController.text,
                        date: _selectedDay!.toLocal().toString().split(' ')[0],
                        location: locationController.text,
                        imageUrl: 'https://via.placeholder.com/150',
                      );
                      Navigator.of(context).pop(newEvent);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a date.')));
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    ).then((result) {
      if (result != null) {
        setState(() {
          if (isEditing) {
            events[index!] = result; // Update existing event
          } else {
            events.add(result); // Add new event
          }
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isEditing ? 'Event updated successfully!' : 'Event added successfully!')));
      }
    });
  }

  Future<void> showEditOrRemoveDialog(int index) async {
    final event = events[index];
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(event.title),
          content: const Text('What would you like to do?'),
          actions: [
            TextButton(
              child: const Text('Edit', style: TextStyle(color: Color.fromARGB(255, 30, 106, 32))),
              onPressed: () {
                Navigator.of(context).pop();
                showEventDialog(event: event, index: index);
              },
            ),
            TextButton(
              child: const Text('Remove', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                showRemoveEventDialog(index);
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showRemoveEventDialog(int index) async {
    final event = events[index];
    bool? shouldRemove = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove Event'),
          content: Text('Are you sure you want to remove ${event.title}?'),
          actions: [
            TextButton(
              child: const Text('Cancel', style: TextStyle(color: Color.fromARGB(255, 30, 106, 32))),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Remove', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (shouldRemove == true) {
      setState(() {
        events.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color.fromARGB(255, 6, 61, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's explore what's happening nearby",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: categories.map((category) => CategoryItem(categoryModel: category)).toList(),
                ),
              ],
            ),
          ),
          TableCalendar(
            calendarStyle:  const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Color.fromARGB(156, 81, 211, 85),
                shape:  BoxShape.circle
              ),
              todayDecoration: BoxDecoration(
      color:Color.fromARGB(255, 30, 106, 32), // Change this color to your desired color
      shape: BoxShape.circle,
    ),
            ),
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Text(
              "All Events",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text('${event.date}\n${event.location}'),
                  isThreeLine: true,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(event.imageUrl),
                  ),
                  onTap: widget.isAdmin ? () => showEditOrRemoveDialog(index) : null,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: widget.isAdmin
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => showEventDialog(),
            )
          : null,
    );
  }
}
