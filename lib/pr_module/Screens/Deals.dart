import 'package:flutter/material.dart';
import 'package:hacker_rank_final/pr_module/services/provider.dart';
import 'package:hacker_rank_final/pr_module/widgets/AdminPostRwquest.dart';
import 'package:hacker_rank_final/pr_module/widgets/AdminRequestCard.dart';
import 'package:hacker_rank_final/pr_module/widgets/Pollbottomsheet.dart';
import 'package:hacker_rank_final/pr_module/widgets/pollcard.dart';
import 'package:hacker_rank_final/pr_module/widgets/post.dart';


import 'package:provider/provider.dart';


class Deals extends StatefulWidget {
  final bool isAdmin;
  const Deals({
    super.key, required this.isAdmin,
  });

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.isAdmin ? 2 : 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderPRService>(builder: (context, pollprovider, _) {
      return Scaffold(
        body: Column(
          children: [
            if (widget.isAdmin)
              SizedBox(
                height: kToolbarHeight, // Same height as AppBar
                child: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Deals'),
                    Tab(text: 'Requests'),
                  ],
                  indicatorColor: Colors.green,
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                ),
              ),
            Expanded(
              child: widget.isAdmin
                  ? TabBarView(
                      controller: _tabController,
                      children: [
                        // Deals Tab
                        ListView.builder(
                          itemCount: pollprovider.polls.length +
                              pollprovider.posts.length,
                          itemBuilder: (context, index) {
                            if (index < pollprovider.polls.length) {
                              final poll = pollprovider.polls[index];
                              return PollCard(
                                  poll: poll,
                                  isAdmin: widget.isAdmin,
                                  pollProvider: pollprovider);
                            } else {
                              final postIndex =
                                  index - pollprovider.polls.length;
                              final post = pollprovider.posts[postIndex];
                              return CustomCard(
                                  index: postIndex,
                                  post: post,
                                  onEdit: (updatedPost) {
                                    pollprovider.editPost(
                                        post['description'], updatedPost);
                                  },  isAdmin: widget.isAdmin, postProvider: pollprovider,);
                            }
                          },
                        ),
                        // Requests Tab
                        ListView.builder(
                          itemCount: pollprovider.pendingPolls.length +
                              pollprovider.pendingPosts.length,
                          itemBuilder: (context, index) {
                            if (index < pollprovider.pendingPolls.length) {
                              final pendingIndex = index;
                              final request =
                                  pollprovider.pendingPolls[pendingIndex];
                              return AdminRequestCard(
                                  request: request, pendingIndex: pendingIndex);
                            } else {
                              final pendingPostIndex =
                                  index - pollprovider.pendingPolls.length;
                              final postRequest =
                                  pollprovider.pendingPosts[pendingPostIndex];
                              return AdminPostRequestCard(
                                  request: postRequest,
                                  pendingIndex: pendingPostIndex);
                            }
                          },
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount:
                          pollprovider.polls.length + pollprovider.posts.length,
                      itemBuilder: (context, index) {
                        if (index < pollprovider.polls.length) {
                          final poll = pollprovider.polls[index];
                          return PollCard(
                              poll: poll,
                              isAdmin: widget.isAdmin,
                              pollProvider: pollprovider);
                        } else {
                          final postIndex = index - pollprovider.polls.length;
                          final post = pollprovider.posts[postIndex];
                          return CustomCard(
                              index: postIndex,
                              post: post,
                              onEdit: (updatedPost) {
                                pollprovider.editPost(
                                    post['description'], updatedPost);
                              }, isAdmin: widget.isAdmin, postProvider: pollprovider,);
                        }
                      },
                    ),
            ),
          ],
        ),
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Add Options'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                             
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddPostBottomSheet(
                                    onSavePoll: (newPost) {
                                      pollprovider.addPost(newPost);
                                   Navigator.of(context).pop();
                                    }, isAdmin: widget.isAdmin, postProvider: pollprovider,
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text('Add Post',
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return PollBottomSheet(
                                    isAdmin: widget.isAdmin,
                                    onSavePoll: (newPoll) {
                                      widget.isAdmin
                                          ? pollprovider.addPoll(newPoll)
                                          : pollprovider.addpollrequestApproval(
                                              context, pollprovider, newPoll);
                                              },
                                    pollProvider: pollprovider,
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text('Add Vote',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              backgroundColor: Colors.green,
              label: const Text('Add', style: TextStyle(color: Colors.white)),
            );
          },
        ),
      );
    });
  }
}
