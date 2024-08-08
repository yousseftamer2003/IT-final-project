import 'package:flutter/material.dart';
import 'package:hacker_rank_final/pr_module/services/provider.dart';

class PollBottomSheet extends StatefulWidget {
  final Map<String, dynamic>? poll;
  final bool isAdmin;
  final Function(Map<String, dynamic>) onSavePoll;
  final ProviderPRService pollProvider;

  const PollBottomSheet(
      {super.key, this.poll, required this.isAdmin, required this.onSavePoll, required this.pollProvider});

  @override
  PollBottomSheetState createState() => PollBottomSheetState();
}

class PollBottomSheetState extends State<PollBottomSheet> {
  List<Map<String, dynamic>> options = [];
  TextEditingController pollTitleController = TextEditingController();
  List<TextEditingController> optionControllers = [];
  bool showError = false;

  @override
  void initState() {
    super.initState();
    if (widget.poll != null) {
      pollTitleController.text = widget.poll!['title'];
      options = List<Map<String, dynamic>>.from(widget.poll!['options']);
      optionControllers = options
          .map((option) => TextEditingController(text: option['title']))
          .toList();
    } else {
      options.add({'id': '1', 'title': '', 'votes': 0});
      optionControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    pollTitleController.dispose();
    for (var controller in optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _savePoll() {
    if (pollTitleController.text.isEmpty ||
        options.any((option) => option['title'].isEmpty)) {
      setState(() {
        showError = true;
      });
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          showError = false;
        });
      });
    } else {
      final newOptions = options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        return {
          'id': option['id'],
          'title': optionControllers[index].text,
          'votes': option['votes'],
        };
      }).toList();
  
      final newPoll = {
        'id': widget.poll != null ? widget.poll!['id'] : DateTime.now().toString(),
        'title': pollTitleController.text,
        'options': newOptions,
      };

      if (widget.isAdmin) {
        widget.onSavePoll(newPoll);
         Navigator.pop(context); // Admin saves directly
      } else {
        // Send request for approval if not an admin
        if (widget.poll != null) {
          widget.pollProvider.editpollrequestApproval(
              context, widget.pollProvider, newPoll, widget.poll!['id']);
               Navigator.pop(context);
        } else {
          widget.pollProvider.addpollrequestApproval(
              context, widget.pollProvider, newPoll);
               Navigator.pop(context);
        }
      }
    }
  }

  void _addOption() {
    setState(() {
      final optionId = (options.length + 1).toString();
      options.add({'id': optionId, 'title': '', 'votes': 0});
      optionControllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: pollTitleController,
              decoration: const InputDecoration(labelText: 'Poll Title'),
              onChanged: (value) {
                setState(() {
                  showError = false;
                });
              },
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final optionController = optionControllers[index];
                return ListTile(
                  title: TextFormField(
                    controller: optionController,
                    decoration: const InputDecoration(labelText: 'Option Title'),
                    onChanged: (value) {
                      setState(() {
                        showError = false;
                        if (widget.poll == null) {
                          options[index]['title'] = value;
                        }
                      });
                    },
                  ),
                );
              },
            ),
            if (showError)
              Center(
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Please fill out all fields.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 320),
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: _addOption,
                child: const Icon(Icons.add, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _savePoll,
              child: const Text(
                'Save Poll',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Function to show the bottom sheet

void showCreatePollBottomSheet(BuildContext context,
    {Map<String, dynamic>? poll,
    required bool isAdmin,
    required Function(Map<String, dynamic>) onSavePoll,
    required ProviderPRService pollProvider}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Add this line to make it expandable
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: PollBottomSheet(
          poll: poll,
          isAdmin: isAdmin,
          onSavePoll: onSavePoll,
          pollProvider: pollProvider,
        ),
      );
    },
  );
}

