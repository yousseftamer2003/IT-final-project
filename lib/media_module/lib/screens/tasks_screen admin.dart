import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String? _fileName;

  String? _filePath;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                onPressed: _pickFile,
                child: Text(
                  'Pick File',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              if (_fileName != null) ...[
                SizedBox(height: 20),
                Text('File Name: $_fileName'),
                Text('File Path: $_filePath'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
