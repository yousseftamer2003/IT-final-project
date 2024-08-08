import 'package:flutter/material.dart';
import 'package:project_oc_committe/modules/Event.dart';
import 'package:project_oc_committe/services/calendar.dart';
import 'package:project_oc_committe/widgets/Calendar.dart';
import 'package:project_oc_committe/widgets/EventForm.dart';
import 'package:provider/provider.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalendarEvents()),
      ],
      child: Consumer<CalendarEvents>(
        builder: (context, value, child) {
          return Expanded(
            //expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width, // to make width 100% of the screen
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(15),
                child: Column(
                      children: [
                        // main calendar
                        Calendar(),

                        // Event form (will be positioned at the bottom left)
                        EventForm(icon: Icon(Icons.add), data: Event(title: "", description: "", location: "", from: "00:00", to: "00:00"), addOrUpdate: true,),
                      ],
                    ),
                ),
              )
          );
        },
      ),
    );
  }
}
