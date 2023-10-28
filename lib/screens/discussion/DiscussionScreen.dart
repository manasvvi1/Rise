import 'package:flutter/material.dart';

import 'Post.dart';
import 'PostDetailScreen.dart';
import 'package:rise/common/util.dart';

class Discussions extends StatefulWidget {
  const Discussions({Key? key}) : super(key: key);

  @override
  State<Discussions> createState() => _DiscussionsState();
}

class _DiscussionsState extends State<Discussions> {
  List<Post> posts = [
    Post(
      title: "How to be happy ☺",
      group: "Mental Health",
      description: "This is the description of the first post. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      likeCount: 102,
      shareCount: 212,
      timestamp: DateTime(2023, 8, 23),
      imageUrl: "https://images.pexels.com/photos/18703635/pexels-photo-18703635/free-photo-of-close-up-of-white-flowers.jpeg?auto=compress",
    ),
    Post(
      title: "Mind happiness 🥶",
      group: "Mental Health",
      description: "This is the description of the second post.",
      likeCount: 822,
      shareCount: 232,
      timestamp: DateTime(2023, 10, 24),
      imageUrl: "https://images.pexels.com/photos/18703635/pexels-photo-18703635/free-photo-of-close-up-of-white-flowers.jpeg?auto=compress",
    ),
    Post(
      title: "Can we sleep?",
      group: "Mental Health",
      description: "This is the description of the third post.",
      likeCount: 822,
      shareCount: 232,
      timestamp: DateTime(2023, 12, 24),
      imageUrl: "https://images.pexels.com/photos/18703635/pexels-photo-18703635/free-photo-of-close-up-of-white-flowers.jpeg?auto=compress",
    ),
    // Add more sample posts here
  ];

  List<String> groups = [
    "Mental Health",
    "Peace World",
    "Daily Activity",
  ];

  final TextEditingController _groupIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Discussion Forum",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: "Posts"), // Rename the tab to "Posts"
              Tab(text: "Groups"), // Rename the tab to "Groups"
            ],
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            _buildPostList(posts), // Posts
            _buildGroupList(context), // Groups
          ],
        ),
      ),
    );
  }

  Widget _buildPostList(List<Post> posts) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle joining a group action
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetailScreen(post),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(post.title + " (${post.group})"),
                    subtitle: Text(post.description),
                  ),
                  Container(
                    height: 200,
                    child: Image.network(
                      post.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(formatDate(post.timestamp)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGroupList(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showJoinGroupDialog(context);
        },
        child: Icon(Icons.group_add),
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: InkWell(
              onTap: () {
                // Handle navigating to the GroupChatScreen
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => GroupChatScreen(groupName: group),
                //   ),
                // );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/200/200'), // Add group image URL here
                ),
                title: Text(group),
                trailing: PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry>[
                      PopupMenuItem(
                        value: 'leave',
                        child: Text('Leave Group'),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 'leave') {
                      // Handle leaving the group here
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showJoinGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Join New Group"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _groupIdController,
                decoration: InputDecoration(labelText: "Group ID"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Handle joining the group with the entered group ID
                String groupId = _groupIdController.text;
                // Implement the joining logic here
                // ...
                Navigator.of(context).pop();
              },
              child: Text("Join"),
            ),
          ],
        );
      },
    );
  }
}
