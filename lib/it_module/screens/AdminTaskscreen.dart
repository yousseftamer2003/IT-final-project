import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/controller/provider.dart';
import 'package:hacker_rank_final/it_module/models/taskmodel/taskdata.dart';
import 'package:hacker_rank_final/it_module/widgets/Taskwidgets/submission.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(task: taskProvider.tasks[index], index: index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 86, 117, 87),
        onPressed: () {
          _showAddTaskBottomSheet(context);
        },
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 4, 4, 4),
        ),
      ),
    );
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => DraggableScrollableSheet(
              expand: false,
              builder: (context, scrollcontrollar) {
                return SingleChildScrollView(
                  controller:scrollcontrollar,
                  child: const AddTask()
                );
              },
            ));
  }
}

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  AddTaskState createState() => AddTaskState();
}

class AddTaskState extends State<AddTask> {
  String taskName = '';
  DateTime? dueDate;
  String taskDetails = '';
  int degree = 0;
  String? filePath;

  Future<void> openfile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        filePath = result.files.single.path;
      });
    } else {}
  }
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
      firstDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != dueDate) {
      setState(() {
        dueDate = pickedDate; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Add New Task',
            style: TextStyle(fontSize: 24),
          ),
          TextFormField(
            decoration: InputDecoration(
                fillColor: const Color.fromARGB(209, 164, 199, 165),
                hintText: 'Task Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40))),
            onChanged: (value) {
              taskName = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: InputDecoration(
                fillColor: const Color.fromARGB(209, 164, 199, 165),
                hintText: 'Details',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40))),
            onChanged: (value) {
              taskDetails = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: const Color.fromARGB(209, 164, 199, 165),
                hintText: 'Degree',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40))),
            onChanged: (value) {
              degree = int.tryParse(value) ?? 0;
            },
          ),
          const SizedBox(height: 16.0),
          _buildFilePickerButton(context),
          const SizedBox(height: 16.0),
          _buildDatePickerButton(context),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _addTask(context);
            },
            child: const Text(
              'Add Task',
              style: TextStyle(color: Color.fromARGB(255, 85, 116, 86)),
            ),
          ),
        ],
      ),
    );
  }

  void _addTask(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    final newTask = Task(
      name: taskName,
      dueDate: dueDate ?? DateTime.now(),
      details: taskDetails,
      Degree: degree,
      submissions: filePath != null
          ? [
              MemberSubmission(
                  filePath: filePath!,
                  memberId: '',
                  memberName: '',
                  submissionDate: DateTime.timestamp())
            ]
          : [],
    );
    provider.addTask(newTask);
    Navigator.pop(context); 
  }

  Widget _buildDatePickerButton(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            selectDate(context);
          },
          icon: const Icon(
            Icons.calendar_today,
            color: Colors.green,
          ),
          label: Text(
            dueDate == null
                ? 'Select Deadline'
                : 'Deadline: ${DateFormat.yMd().format(dueDate!)}',
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildFilePickerButton(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white)),
          onPressed: () {
            openfile(context);
          },
          icon: const Icon(
            Icons.attach_file,
            color: Colors.green,
          ),
          label: Text(
            filePath == null ? 'Attach File' : 'File Attached',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        if (filePath != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(filePath!),
          ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task task;
  final int index;

  const TaskCard({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      child: ListTile(
        title: Text(task.name),
        subtitle: Text(task.dueDate.toString()),
        onTap: () {
          _showTaskBottomSheet(context, task, index);
        },
      ),
    );
  }

  void _showTaskBottomSheet(BuildContext context, Task task, int index) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => DraggableScrollableSheet(
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  controller: scrollController,
                  child: TaskBottomSheet(task: task, index: index));
            }));
  }
}

class TaskBottomSheet extends StatefulWidget {
  final Task task;
  final int index;

  const TaskBottomSheet({super.key, required this.task, required this.index});

  @override
  _TaskBottomSheetState createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  late TextEditingController _nameController;
  late TextEditingController _detailsController;
  late int degree;
  late DateTime _dueDate;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.task.name);
    _detailsController = TextEditingController(text: widget.task.details);
    degree = widget.task.Degree;
    _dueDate = widget.task.dueDate;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Task Details', style: TextStyle(fontSize: 24.0)),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: 'Task Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _detailsController,
                decoration: InputDecoration(
                    hintText: 'Details',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                initialValue: degree.toString(),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    degree = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Degree',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromARGB(255, 128, 152, 129))),
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: const Text(
                      'Select Deadline',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text('Deadline: ${DateFormat.yMd().format(_dueDate)}'),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 128, 152, 129))),
                onPressed: () {
                  _updateTask(context);
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 127, 157, 115))),
                onPressed: () {
                  _deleteTask(context);
                },
                child: const Text(
                  'Delete Task',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Member Submissions',
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(255, 66, 83, 66)),
              ),
              SizedBox(
                height: 200, // Adjust height as needed
                child: ListView.builder(
                  itemCount: widget.task.submissions.length,
                  itemBuilder: (context, index) {
                    return SubmissionListItem(
                      submission: widget.task.submissions[index],
                      taskIndex: widget.index,
                      submissionIndex: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (pickedDate != null && pickedDate != _dueDate) {
      setState(() {
        _dueDate = pickedDate;
      });
    }
  }

  void _updateTask(BuildContext context) {
    final updatedTask = Task(
      name: _nameController.text,
      dueDate: _dueDate,
      details: _detailsController.text,
      Degree: degree,
      submissions: widget.task.submissions,
    );
    Provider.of<TaskProvider>(context, listen: false)
        .updateTask(widget.index, updatedTask);
    Navigator.pop(context);
  }

  void _deleteTask(BuildContext context) {
    Provider.of<TaskProvider>(context, listen: false).deleteTask(widget.index);
    Navigator.of(context).pop();
  }
}
