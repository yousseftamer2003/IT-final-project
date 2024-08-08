// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';

import 'package:hacker_rank_final/pr_module/services/provider.dart';
import 'package:hacker_rank_final/pr_module/widgets/Pollbottomsheet.dart';


class PollCard extends StatefulWidget {
  final Map<String, dynamic> poll;
  final bool isAdmin;
  final ProviderPRService pollProvider;
 

   const PollCard(
      {super.key,
      required this.poll,
      required this.isAdmin,
      required this.pollProvider});
  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: Column(
        children: [
          Card(
             margin: const EdgeInsets.symmetric(vertical: 10.0),
          
            color: const Color.fromARGB(255, 221, 235, 221),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Poll ${widget.pollProvider.polls.indexOf(widget.poll) + 1}: ${widget.poll['title']}',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 2, 45, 4),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    PopupMenuButton<String>(
                      iconColor: Colors.black,
                      iconSize: 25,
                      shadowColor: Colors.green,
                      onSelected: (value) async {
                        if (value == 'edit') {
                          showCreatePollBottomSheet(
                            context,
                            poll: widget.poll,
                            isAdmin: widget.isAdmin,
                            onSavePoll: (updatedPoll) {
                              if (widget.isAdmin==true) {
                                widget.pollProvider
                                    .editPoll(widget.poll['id'], updatedPoll);
                              } else {
             widget.pollProvider.editpollrequestApproval(
                                    context,
                                    widget.pollProvider,
                                    updatedPoll,
                                    widget.poll['id'],
                                  
                                    );
                              }
                            
                            }, pollProvider:widget.pollProvider,
                          );
                        } else if (value == 'delete') {
                         if(widget.isAdmin==true){
          widget.pollProvider.deletepoll(widget.poll['id']);
                         }else{
          widget.pollProvider.deletepollrequestApproval(
                                context, widget.pollProvider, widget.poll['id']);
                         }
                             
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return {'Edit', 'Delete'}.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice.toLowerCase(),
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    )
                  ],
                ),
                const SizedBox(height: 10),
                FlutterPolls(
                  pollId: widget.poll['id'],
                  onVoted: (PollOption pollOption, int newTotalVotes) async {
                    widget.pollProvider.onVote(widget.poll['id'], pollOption.id);
                    return true;
                  },
                  leadingVotedProgessColor: const Color.fromARGB(255, 84, 181, 87),
                  pollOptionsSplashColor: Colors.white,
                  votedProgressColor:
                      const Color.fromARGB(255, 110, 133, 120).withOpacity(0.3),
                  votedBackgroundColor: Colors.grey.withOpacity(0.2),
                  votesTextStyle: Theme.of(context).textTheme.titleMedium,
                  votedPercentageTextStyle:
                      Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                          ),
                  votedCheckmark: const Icon(
                    Icons.check_circle,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 18,
                  ),
                  pollTitle: AutoSizeText(
                    widget.poll['title'],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  pollOptions: widget.poll['options'].map<PollOption>((option) {
                    return PollOption(
                      id: option['id'],
                      title: AutoSizeText(
                        option['title'],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      votes: option['votes'],
                    );
                  }).toList(),
                  metaWidget: const Row(
                    children: [
                      SizedBox(width: 6),
                      AutoSizeText(
                        '•',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 6),
                      AutoSizeText(
                        'Poll',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),

        ],
        

      ),




    );
  }
}
