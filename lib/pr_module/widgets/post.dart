import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hacker_rank_final/pr_module/services/provider.dart';
import 'package:image_picker/image_picker.dart';

void showCreatePollBottomSheet(BuildContext context,
    {Map<String, dynamic>? post,
    required bool isAdmin,
    required Function(Map<String, dynamic>) onSavePoll,
    required ProviderPRService postProvider}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Make the bottom sheet expandable
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddPostBottomSheet(
          post: post,
          isAdmin: isAdmin,
          onSavePoll: onSavePoll,
          postProvider: postProvider,
        ),
      );
    },
  );
}


class AddPostBottomSheet extends StatefulWidget {
  final bool isAdmin;
  final Map<String, dynamic>? post;
  final Function(Map<String, dynamic>) onSavePoll;
  final ProviderPRService postProvider;
  const AddPostBottomSheet(
      {super.key,
      this.post,
      required this.onSavePoll,
      required this.isAdmin,
      required this.postProvider});

  @override
  AddPostBottomSheetState createState() => AddPostBottomSheetState();
}

class AddPostBottomSheetState extends State<AddPostBottomSheet> {
  TextEditingController descriptionController = TextEditingController();
  File? _imageFile;
  final picker = ImagePicker();
  bool get isEditing => widget.post != null;
  bool showError = false;

  @override
  void initState() {
    super.initState();
    if (isEditing) {
      descriptionController.text = widget.post!['description'];
      if (widget.post!['image'] != null && widget.post!['image']!.isNotEmpty) {
        _imageFile = File(widget.post!['image']!);
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _savePost() {
    if (descriptionController.text.isEmpty) {
      setState(() {
        showError = true;
      });
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          showError = false;
        });
      });
    } else {
      final newPost = {
        'description': descriptionController.text,
        'image': _imageFile?.path ?? '',
      };
      if (widget.isAdmin) {
        widget.onSavePoll(newPost);
        Navigator.pop(context);
      } else {
        if (widget.post != null) {
          widget.postProvider.editPostRequestApproval(
              context, widget.post!['description'], newPost);
          Navigator.pop(context);
        } else {
          widget.postProvider.addPostRequestApproval(context, newPost);
          Navigator.pop(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: _imageFile == null
                    ? const Icon(Icons.add_a_photo, size: 50)
                    : Image.file(_imageFile!, height: 200, fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  setState(() {
                    showError = false;
                  });
                },
              ),
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _savePost,
                child: const Text(
                  'Save Post',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final bool isAdmin;
  final int index;
  final Map<String, dynamic> post;
  final Function(Map<String, dynamic>) onEdit;
  final ProviderPRService postProvider;

  const CustomCard({
    super.key,
    required this.index,
    required this.post,
    required this.onEdit,
    required this.postProvider,
    required this.isAdmin,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: SizedBox(
            width: 300,
            height: 300,
            child: Stack(
              children: [
                widget.post['image'] != ''
                    ? Image.file(
                        File(widget.post['image']),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image),
                Positioned(
                  top: 10,
                  right: 10,
                  child: PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'edit') {
                        showCreatePollBottomSheet(
                          context,
                          post: widget.post,
                          isAdmin: widget.isAdmin,
                          onSavePoll: (updatePost) {
                            if (widget.isAdmin) {
                              widget.postProvider.editPost(
                                  widget.post['description'], updatePost);
                            } else {
                              widget.postProvider.editPostRequestApproval(
                                  context,
                                  widget.post['description'],
                                  updatePost);
                            }
                          },
                          postProvider: widget.postProvider,
                        );
                      } else if (value == 'delete') {
                        if (widget.isAdmin) {
                          widget.postProvider
                              .deletePost(widget.post['description']);
                        } else {
                          widget.postProvider.deletePostRequestApproval(
                              context, widget.post['description']);
                        }
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ];
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: Color.fromARGB(255, 19, 51, 28),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.post['description'],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
