// Yahya Mahmoud

import 'package:flutter/material.dart';
import 'package:project_oc_committe/constants/colors.dart';
import 'package:project_oc_committe/modules/Event.dart';
import 'package:project_oc_committe/widgets/EventForm.dart';

class EventBox extends StatefulWidget {
  const EventBox({super.key, required this.data});
  final Event data;

  @override
  State<EventBox> createState() => _EventBoxState();
}

class _EventBoxState extends State<EventBox> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: const Border(left: BorderSide(color: mainGreen, width: 3.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.data.startDate.toString()),
              Text(widget.data.title),

              // drop down button
              IconButton(
                  onPressed: () {
                    setState(() {
                      // to toggle it
                      showDetails = !showDetails;
                    });
                  },
                  icon: showDetails
                      ? const Icon(Icons.arrow_drop_up)
                      : const Icon(Icons.arrow_drop_down)),

              // more details as dropdown menu
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: showDetails
                    ? [
                        Text("Location: "),
                        Text(widget.data.location.length > 0
                            ? widget.data.location
                            : "No Location Specified"),
                        Text("description: "),
                        Text(widget.data.description.length > 0
                            ? widget.data.description
                            : "No Description"),
                      ]
                    : [],
              ),
            ],
          ),
          EventForm(icon: const Icon(Icons.edit), data: widget.data, addOrUpdate: false,),
        ],
      ),
    );
  }
}
