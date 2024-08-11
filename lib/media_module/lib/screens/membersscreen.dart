import 'package:flutter/material.dart';
import 'package:media/Models/MemeberModel.dart';

class MembersScreen extends StatefulWidget {
  final bool isAdmin;

  const MembersScreen({Key? key, required this.isAdmin}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  final List<Member> members = [
    const Member(name: 'George Lindelof', email: 'carlsen@armand.no', score: 85),
    const Member(name: 'Eric Dyer', email: 'cristofor.ajer@lone.no', score: 90),
    const Member(name: 'Haitam Alissami', email: 'haitam@gmail.com', score: 75),
    const Member(name: 'Michael Cambel', email: 'camp@hotmail.com', score: 60),
    const Member(name: 'Ashley Williams', email: 'william.ash@newl.com', score: 95),
    const Member(name: 'Vanessa Paradi', email: 'paradi.van@google.com', score: 80),
    const Member(name: 'Lora Palmer', email: 'lora.palm@gmail.com', score: 70),
    const Member(name: 'Christy Newborn', email: 'chris@amazon.com', score: 65),
    const Member(name: 'Nick Jackel', email: 'jackel1234@google.com', score: 85),
    const Member(name: 'Tora Laundren', email: 'tora.lan@gmail.com', score: 90),
    const Member(name: 'Malisha Manis', email: 'manisha@hotmail.com', score: 75),
  ];

  List<Member> filteredMembers = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredMembers = members;
    searchController.addListener(() {
      filterMembers();
    });
  }

  void filterMembers() {
    List<Member> results = [];
    if (searchController.text.isEmpty) {
      results = members;
    } else {
      results = members
          .where((member) =>
              member.name.toLowerCase().contains(searchController.text.toLowerCase()) ||
              member.email.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredMembers = results;
    });
  }

  void removeMember(int index) {
    setState(() {
      filteredMembers.removeAt(index);
    });
  }

  void editScore(int index, int newScore) {
    setState(() {
      filteredMembers[index] = Member(
        name: filteredMembers[index].name,
        email: filteredMembers[index].email,
        score: newScore,
      );
    });
  }

  Future<void> showEditScoreDialog(BuildContext context, int index) async {
    final member = filteredMembers[index];
    int? newScore = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        int tempScore = member.score;
        return AlertDialog(
          title: Text('Edit Score', style: TextStyle(color: const Color.fromARGB(255, 50, 116, 52))),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              tempScore = int.tryParse(value) ?? member.score;
            },
            controller: TextEditingController(text: member.score.toString()),
          ),
          actions: [
            TextButton(
              child: Text('Cancel', style: TextStyle(color: const Color.fromARGB(255, 30, 106, 32))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save', style: TextStyle(color: const Color.fromARGB(255, 30, 106, 32))),
              onPressed: () {
                Navigator.of(context).pop(tempScore);
              },
            ),
          ],
        );
      },
    );

    if (newScore != null) {
      editScore(index, newScore);
    }
  }

  Future<void> showRemoveMemberDialog(BuildContext context, int index) async {
    final member = filteredMembers[index];
    bool? shouldRemove = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove Member', style: TextStyle(color: const Color.fromARGB(255, 159, 23, 23))),
          content: Text('Are you sure you want to remove ${member.name}?'),
          actions: [
            TextButton(
              child: Text('Cancel', style: TextStyle(color: const Color.fromARGB(255, 30, 106, 32))),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Remove', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (shouldRemove == true) {
      removeMember(index);
    }
  }

  Future<void> showAdminOptions(BuildContext context, int index) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Admin Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit, color: Colors.green),
                title: Text('Edit Score', style: TextStyle(color: const Color.fromARGB(255, 50, 116, 52))),
                onTap: () {
                  Navigator.pop(context);
                  showEditScoreDialog(context, index);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.green),
                title: Text('Remove Member', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  showRemoveMemberDialog(context, index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search members...',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: filteredMembers.length,
              separatorBuilder: (context, index) => Divider(color: Colors.green),
              itemBuilder: (context, index) {
                final member = filteredMembers[index];
                return ListTile(
                  title: Text(
                    member.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    member.email,
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing:widget.isAdmin? Text(
                    member.score.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ): null,
                  onTap: () {
                    if (widget.isAdmin) {
                      showAdminOptions(context, index);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
