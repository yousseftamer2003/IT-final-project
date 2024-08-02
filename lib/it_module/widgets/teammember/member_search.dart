import 'package:flutter/material.dart';
import 'package:hacker_rank_final/it_module/models/teammember/team_member.dart';

class TeamMemberSearchDelegate extends SearchDelegate {
  final List<TeamMember> teamMembers;
  final Function(TeamMember) onMemberSelected;

  TeamMemberSearchDelegate(this.teamMembers, this.onMemberSelected);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<TeamMember> results = teamMembers.where((member) {
      return member.name.toLowerCase().contains(query.toLowerCase()) ||
          member.email.toLowerCase().contains(query.toLowerCase()) ||
          member.score.contains(query);
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final member = results[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 76, 101, 76),
            child: Text(member.name[0]),
          ),
          title: Text(
            member.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(member.email),
          trailing: Text(
            member.score,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            query = member.name;
            onMemberSelected(member);
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<TeamMember> suggestions = teamMembers.where((member) {
      return member.name.toLowerCase().contains(query.toLowerCase()) ||
          member.email.toLowerCase().contains(query.toLowerCase()) ||
          member.score.contains(query);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final member = suggestions[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor:const Color.fromARGB(255, 89, 125, 89) ,
            child: Text(member.name[0]),
          ),
          title: Text(
            member.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(member.email),
          trailing: Text(
            member.score,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            query = member.name;
            onMemberSelected(member);
            showResults(context);
          },
        );
      },
    );
  }
}