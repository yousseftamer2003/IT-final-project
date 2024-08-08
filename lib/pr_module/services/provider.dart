import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hacker_rank_final/pr_module/models/taskmodel/taskdata.dart';


class ProviderPRService extends ChangeNotifier {
  List<Map<String, dynamic>> pendingPolls = [
    {
      'type': 'add',
      'poll': {
        'id': '2',
        'title': 'Which is your favorite color?',
        'options': [
          {'id': '1', 'title': 'Red', 'votes': 5},
          {'id': '2', 'title': 'Blue', 'votes': 10},
          {'id': '3', 'title': 'Green', 'votes': 8},
        ],
      },
    },
    {
      'type': 'edit',
      'pollId': '1',
      'updatedPoll': {
        'id': '1',
        'title': 'What is your favorite programming language? (Updated)',
        'options': [
          {'id': '1', 'title': 'Java', 'votes': 10},
          {'id': '2', 'title': 'Python', 'votes': 20},
          {'id': '3', 'title': 'c++', 'votes': 30},
        ],
      },
    },
    {
      'type': 'delete',
      'pollId': '1',
    },
  ];

  List<Map<String, dynamic>> pendingPosts = [
    {
      'type': 'add',
      'post': {
        'description': 'Check out my new post!',
        'image': '',
      },
    },
    {
      'type': 'edit',
      'postDescription': 'Big Sale',
      'updatedPost': {
        'description': 'Updated description of the post',
        'image': 'assets/download (5).jpeg',
      },
    },
    {
      'type': 'delete',
      'postDescription': 'Big Sale',
    },
  ];


  List<Map<String, dynamic>> posts = [
    {
      'image': '',
      'description': 'Big Sale',
    }
  ];

  void addPost(Map<String, dynamic> newpost) {
    posts.add(newpost);
    notifyListeners();
  }

  void editPost(String postdescription, Map<String, dynamic> updatedpost) {
    int index =
        posts.indexWhere((post) => post['description'] == postdescription);
    if (index != -1) {
      posts[index] = updatedpost;
      notifyListeners();
    }
  }

  void deletePost(String postdescription) {
    posts.removeWhere((post) => post['description'] == postdescription);
    notifyListeners();
  }

  List<Map<String, dynamic>> polls = [
    {
      'id': '1',
      'title': 'What is your favorite programming language?',
      'options': [
        {'id': '1', 'title': 'Java', 'votes': 10},
        {'id': '2', 'title': 'Python', 'votes': 20},
        {'id': '3', 'title': 'JavaScript', 'votes': 30},
      ],
    }
  ];

  void addPoll(Map<String, dynamic> newpoll) {
    polls.add(newpoll);
    notifyListeners();
  }

  void editPoll(String pollid, Map<String, dynamic> updatedpoll) {
    int index = polls.indexWhere((poll) => poll['id'] == pollid);
    if (index != -1) {
      polls[index] = updatedpoll;
      notifyListeners();
    }
  }

  void deletepoll(String pollid) {
    polls.removeWhere((poll) => poll['id'] == pollid);
    notifyListeners();
  }

  void onVote(String pollId, String? optionId) {
    if (optionId != null) {
      int pollIndex = polls.indexWhere((poll) => poll['id'] == pollId);
      if (pollIndex != -1) {
        int optionIndex = polls[pollIndex]['options']
            .indexWhere((option) => option['id'] == optionId);
        if (optionIndex != -1) {
          polls[pollIndex]['options'][optionIndex]['votes']++;
          notifyListeners();
        }
      }
    }
  }

  bool? isApporved;

  void deletepollrequestApproval(
      BuildContext context, ProviderPRService pollProvider, String pollId) {
    pendingPolls.add({
      'type': 'delete',
      'pollId': pollId,
    });
    notifyListeners();
     showApprovalDialog(context, 'delete');
  }

  void editpollrequestApproval(BuildContext context, ProviderPRService pollProvider,
      Map<String, dynamic> updatedPoll, String pollId) {
    pendingPolls.add({
      'type': 'edit',
      'pollId': pollId,
      'updatedPoll': updatedPoll,
    });
    notifyListeners();
      showApprovalDialog(context, 'edit');
  }

  void addpollrequestApproval(BuildContext context, ProviderPRService pollProvider,
      Map<String, dynamic> newPoll) {
    pendingPolls.add({
      'type': 'add',
      'poll': newPoll,
    });
    notifyListeners();
    showApprovalDialog(context, 'add');
  }

  void approveRequest(int index) {
    final request = pendingPolls[index];
    if (request['type'] == 'add') {
      addPoll(request['poll']);
    } else if (request['type'] == 'edit') {
      editPoll(request['pollId'], request['updatedPoll']);
    } else if (request['type'] == 'delete') {
      deletepoll(request['pollId']);
    }
    pendingPolls.removeAt(index);
    notifyListeners();
  }

  void rejectRequest(int index) {
    pendingPolls.removeAt(index);
    notifyListeners();
  }

  void showApprovalDialog(BuildContext context, String type) {
    Future.microtask(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Approval Required'),
            content: Text(
                'Your $type request has been sent to the admin for approval.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
             
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }
   void addPostRequestApproval(BuildContext context, Map<String, dynamic> newPost) {
    pendingPosts.add({
      'type': 'add',
      'post': newPost,
    });
    notifyListeners();
    showApprovalDialog(context, 'add post');
  }
   void editPostRequestApproval(BuildContext context, String postDescription, Map<String, dynamic> updatedPost) {
    pendingPosts.add({
      'type': 'edit',
      'postDescription': postDescription,
      'updatedPost': updatedPost,
    });
    notifyListeners();
    showApprovalDialog(context, 'edit post');
  }
    void deletePostRequestApproval(BuildContext context, String postDescription) {
    pendingPosts.add({
      'type': 'delete',
      'postDescription': postDescription,
    });
    notifyListeners();
    showApprovalDialog(context, 'delete post');
  }
   void approvePostRequest(int index) {
    final request = pendingPosts[index];
    if (request['type'] == 'add') {
      addPost(request['post']);
    } else if (request['type'] == 'edit') {
      editPost(request['postDescription'], request['updatedPost']);
    } else if (request['type'] == 'delete') {
      deletePost(request['postDescription']);
    }
    pendingPosts.removeAt(index);
    notifyListeners();
  }
    void rejectPostRequest(int index) {
    pendingPosts.removeAt(index);
    notifyListeners();
  }

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  ProviderService() {
    _generateFakeData();
  }

  void _generateFakeData() {
    _tasks = List.generate(
      5,
      (index) => Task(
        name: 'Task ${index + 1}',
        dueDate: DateTime.now().add(Duration(days: index)),
        details: 'Details for Task ${index + 1}',
        Degree: (index + 1) * 10,
        submissions: List.generate(
          index + 1,
          (subIndex) => MemberSubmission(
            memberId: 'member${subIndex + 1}',
            memberName: 'Member Name ${subIndex + 1}',
            filePath: '/path/to/file${subIndex + 1}.pdf',
            degree: subIndex * 5,
            submissionDate: DateTime.now(),
          ),
        ),
      ),
    );
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
 

  void updateTask(int taskIndex, Task updatedTask) {
    _tasks[taskIndex] = updatedTask;
    notifyListeners();
  }

  void updateSubmissionDetails(int taskIndex, int submissionIndex, int degree, String comment) {
    _tasks[taskIndex].submissions[submissionIndex].degree = degree;
    _tasks[taskIndex].submissions[submissionIndex].comments = comment;
    notifyListeners();
  }
    void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }


  Future<String?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return result.files.single.path;
    } else {
      return null;
    }
  }
}


