
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/models/taskmodel/taskdata.dart';



class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskProvider() {
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
