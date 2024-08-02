import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/controller/provider.dart';
import 'package:hacker_rank_final/it_module/data/taskdata.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SubmissionListItem extends StatefulWidget {
  final MemberSubmission submission;
  final int taskIndex;
  final int submissionIndex;

  const SubmissionListItem({super.key, 
    required this.submission,
    required this.taskIndex,
    required this.submissionIndex,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SubmissionListItemState createState() => _SubmissionListItemState();
}

class _SubmissionListItemState extends State<SubmissionListItem> {
  late TextEditingController _degreeController;
  late TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _degreeController = TextEditingController(text: widget.submission.degree.toString());
    _commentController = TextEditingController(text: widget.submission.comments);
  }

  @override
  void dispose() {
    _degreeController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Member: ${widget.submission.memberName}'), 
            InkWell(
              onTap: () {
                _openFile(widget.submission.filePath);
              },
              child: Text(
                'File Path: ${widget.submission.filePath}',
                style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _degreeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Degree'),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _commentController,
              decoration: const InputDecoration(labelText: 'Comment'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                _submitDetails(context);
              },
              child: const Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                _openFile(widget.submission.filePath);
              },
              child: const Text('Download and Open File'),
            ),
          ],
        ),
      ),
    );
  }

  void _openFile(String filePath) async {
    final Uri fileUri = Uri.file(filePath);
    if (await canLaunchUrlString(fileUri.toString())) {
      await launchUrlString(fileUri.toString());
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the file.')),
      );
    }
  }

  void _submitDetails(BuildContext context) {
    final degree = int.tryParse(_degreeController.text) ?? 0;
    final comment = _commentController.text;
    Provider.of<TaskProvider>(context, listen: false).updateSubmissionDetails(
      widget.taskIndex,
      widget.submissionIndex,
      degree,
      comment,
    );
  }
}
