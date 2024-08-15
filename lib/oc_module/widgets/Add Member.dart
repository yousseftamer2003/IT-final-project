import 'package:flutter/material.dart';

class AddMember extends StatefulWidget {
  const AddMember({
    super.key,
    required this.data,
    required this.add,
  });
  final dynamic data;
  final bool add;

  // final String addOrUpdate = addOrUpdate;

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  TextEditingController name = TextEditingController();
  String? role = 'Member';
  String? year = "First Year";

    @override
  void initState() {
    name.text = widget.data["name"]??"";
    role = widget.data["role"]??"Member";
    year = widget.data["year"]??"First Year";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      scrollable: true,
                      title: Text("${widget.add ? "Add" : "Update"} Person"),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name
                              TextFormField(
                                controller: name,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                ),
                              ),
                              // Role
                              DropdownButton<String>(
                                value: role,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    role = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Member',
                                  'Head',
                                  'Vice Head'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // Year
                              DropdownButton<String>(
                                value: year,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    year = newValue!;
                                  });
                                },
                                items: <String>[
                                  'First Year',
                                  'Second Year',
                                  'Third Year',
                                  'Fourth Year',
                                  'Fifth Year',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              ElevatedButton(
                                onPressed: () {
                                  // will make post request and
                                  // add it to database
                                  // if "add" == true => POST request
                                  // if "add" == false => PUT request
                                  // will also make validations here
                                },
                                child: Text(widget.add ? "Add" : "Update"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          child: Icon(widget.add ? Icons.add : Icons.edit),
        ),
      ],
    );
  }
}
