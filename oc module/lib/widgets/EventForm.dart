import 'package:flutter/material.dart';
import 'package:project_oc_committe/modules/Event.dart';
import 'package:project_oc_committe/services/calendar.dart';
import 'package:provider/provider.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key, required this.icon, required this.data, required this.addOrUpdate});
  final Icon icon;
  final Event data;
  final bool addOrUpdate;

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  // information about the event that will be added and used will change it
  TextEditingController eventDescription = TextEditingController();
  TextEditingController eventTitle = TextEditingController();
  TextEditingController eventLocation = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();

  @override
  void initState() {
    eventDescription.text = widget.data.description;
    eventTitle.text = widget.data.title;
    eventLocation.text = widget.data.location;
    from.text = widget.data.from;
    to.text = widget.data.to;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarEvents>(
      builder: (context, value, _) {
        return FloatingActionButton(
          child: widget.icon,
          onPressed: () {
            // You can use `ref` here.
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Add Event'),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: [
                          // Title text input
                          TextFormField(
                            controller: eventTitle,
                            decoration: const InputDecoration(
                              labelText: 'Title',
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                    controller: from,
                                    decoration: InputDecoration(
                                      labelText: "Start time",
                                      hintText: "Start time",
                                    )),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                    controller: to,
                                    decoration: InputDecoration(
                                      labelText: "End time",
                                      hintText: "End time",
                                    )),
                              )
                            ],
                          ),

                          // Location text input
                          TextFormField(
                            controller: eventLocation,
                            decoration: const InputDecoration(
                              labelText: 'Location',
                            ),
                          ),

                          // Description text input
                          TextFormField(
                            controller: eventDescription,
                            decoration: const InputDecoration(
                              labelText: 'Description',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            child: const Text("Discard"),
                            onPressed: () {
                              // to close the popup form
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                            }),
                        ElevatedButton(
                            child: Text(widget.addOrUpdate ? "Create" : "Update"),
                            onPressed: () {
                              try {
                                DateTime curr = DateTime.now();

                                // create event object
                                Event obj = Event(
                                    description: eventDescription.text,
                                    location: eventLocation.text,
                                    title: eventTitle.text,
                                    from: from.text,
                                    to: to.text);

                                obj.startDate = value.selectedDay;
                                obj.endDate = curr;

                                if(widget.addOrUpdate) {

                                  // and will make post request to add
                                  value.addEvent(
                                      DateTime.utc(
                                          value.selectedDay.year,
                                          value.selectedDay.month,
                                          value.selectedDay.day),
                                      obj);
                                }else {
                                  // and will make put request to update
                                }

                                if(widget.addOrUpdate) {
                                  // to reset input fields
                                  eventTitle.text = "";
                                  eventDescription.text = "";
                                  eventLocation.text = "";
                                  from.text = "";
                                  to.text = "";
                                }

                                // shows message to user
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Event Updated Successfully")));
                              } catch (err) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Some Thing went wrong")));
                              }

                              // to close the popup form
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                            }),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
