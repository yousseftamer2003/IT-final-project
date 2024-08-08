import 'package:flutter/material.dart';
import 'package:hacker_rank_final/pr_module/services/provider.dart';
import 'package:provider/provider.dart';

class AdminRequestCard extends StatelessWidget {
  final Map<String, dynamic> request;
  final int pendingIndex;

  AdminRequestCard({required this.request, required this.pendingIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
          
            color: const Color.fromARGB(255, 221, 235, 221),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${request['type']} request for poll ${request['pollId'] ?? request['poll']?['id']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (request['type'] == 'edit' || request['type'] == 'add')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (request['type'] == 'edit' && request['updatedPoll'] != null)
                    Text('Title: ${request['updatedPoll']?['title'] ?? 'N/A'}'),
                  if (request['type'] == 'add' && request['poll'] != null)
                    Text('Title: ${request['poll']?['title'] ?? 'N/A'}'),
                  if ((request['type'] == 'edit' && request['updatedPoll']?['options'] != null) ||
                      (request['type'] == 'add' && request['poll']?['options'] != null))
                    ...((request['type'] == 'edit' ? request['updatedPoll']['options'] : request['poll']['options']) as List)
                        .map<Widget>((option) {
                      return Text('Option ${option['id']}: ${option['title']} (Votes: ${option['votes'] ?? 0})');
                    }),
                ],
              ),
            if (request['type'] == 'delete')
              Text('Poll ID: ${request['pollId']}'),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.check,color: Colors.green),
                  onPressed: () {
                    final pollprovider = Provider.of<ProviderPRService>(context, listen: false);
                    pollprovider.approveRequest(pendingIndex);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.close,color: Colors.green),
                  onPressed: () {
                    final pollprovider = Provider.of<ProviderPRService>(context, listen: false);
                    pollprovider.rejectRequest(pendingIndex);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
