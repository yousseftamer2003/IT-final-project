import 'package:flutter/material.dart';
import 'package:hacker_rank_final/pr_module/services/provider.dart';
import 'package:provider/provider.dart';

class AdminPostRequestCard extends StatelessWidget {
  final Map<String, dynamic> request;
  final int pendingIndex;

  AdminPostRequestCard({required this.request, required this.pendingIndex});

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
              '${request['type']} request for post ${request['postDescription'] ?? request['post']?['description']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (request['type'] == 'edit' || request['type'] == 'add')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (request['type'] == 'edit' && request['updatedPost'] != null)
                    Text('Description: ${request['updatedPost']?['description'] ?? 'N/A'}'),
                  if (request['type'] == 'add' && request['post'] != null)
                    Text('Description: ${request['post']?['description'] ?? 'N/A'}'),
                ],
              ),
            if (request['type'] == 'delete')
              Text('Post Description: ${request['postDescription']}'),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.check,color: Colors.green),
                  onPressed: () {
                    final pollprovider = Provider.of<ProviderPRService>(context, listen: false);
                    pollprovider.approvePostRequest(pendingIndex);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.close,color: Colors.green,),
                  onPressed: () {
                    final pollprovider = Provider.of<ProviderPRService>(context, listen: false);
                    pollprovider.rejectPostRequest(pendingIndex);
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
