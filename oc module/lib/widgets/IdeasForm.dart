// for admins only

import 'package:flutter/material.dart';

class IdeasForm extends StatefulWidget {
  const IdeasForm({super.key});

  @override
  State<IdeasForm> createState() => _EventFormState();
}

class _EventFormState extends State<IdeasForm> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
          child: const Text('Add Idea'),
          onPressed: () {
            // You can use `ref` here.
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Add Idea'),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: [
                          // Title text input
                          TextFormField(
                            controller: title,
                            decoration: const InputDecoration(
                              labelText: 'Title',
                            ),
                          ),

                          //
                          TextField(
                            controller: description,
                            maxLines: null, // Allows the TextField to expand vertically
                            decoration: InputDecoration(
                            hintText: 'Enter your text here...',
                            border: OutlineInputBorder(),
                          )),
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
                            child: const Text("Create"),
                            onPressed: () {
                              try{

                                // will make here post request and add the idea

                                // shows message to user
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Idea added Successfully")));
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
  }
}
