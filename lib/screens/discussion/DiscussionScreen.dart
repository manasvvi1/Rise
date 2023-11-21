import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../common/util.dart';
import 'Group.dart';
import 'Post.dart';
import 'PostDetailScreen.dart';

class Discussions extends StatefulWidget {
  const Discussions({Key? key}) : super(key: key);

  @override
  State<Discussions> createState() => _DiscussionsState();
}

class _DiscussionsState extends State<Discussions> {
  DatabaseReference _postsRef = FirebaseDatabase.instance.ref().child('posts');
  DatabaseReference _groupsRef = FirebaseDatabase.instance.ref().child('groups');

  List<Post> posts = [];
  List<Group> groups = [];

  final TextEditingController _newGroupNameController = TextEditingController();
  final TextEditingController _newGroupImageController = TextEditingController();
  final TextEditingController _groupIdController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _newPostTitleController = TextEditingController();
  final TextEditingController _newPostDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await Firebase.initializeApp();
    _fetchPosts();
    _fetchGroups();
  }

  Future<void> _fetchPosts() async {
    DatabaseEvent event = await _postsRef.once();

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> postsMap = (event.snapshot.value as Map<dynamic, dynamic>);

      List<Post> fetchedPosts = postsMap.entries.map((entry) {
        return Post(
          title: entry.value['title'],
          description: entry.value['description'],
          timestamp: DateTime.parse(entry.value['timestamp']),
          imageUrl: entry.value['imageUrl'],
          groupId: entry.value['groupId'],
          likeCount: entry.value['likeCount'] ?? 0,
          shareCount: entry.value['shareCount'] ?? 0,
        );
      }).toList();

      setState(() {
        posts = fetchedPosts;
      });
    }
  }

  Future<void> _fetchGroups() async {
    DatabaseEvent event = await _groupsRef.once();

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> groupsMap = (event.snapshot.value as Map<dynamic, dynamic>);

      List<Group> fetchedGroups = groupsMap.entries.map((entry) {
        return Group(
          name: entry.value['name'],
          groupId: entry.value['groupId'],
          imageUrl: entry.value['imageUrl'],
        );
      }).toList();

      setState(() {
        groups = fetchedGroups;
      });
    }
  }

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
              Tab(text: "Posts"),
              Tab(text: "Groups"),
            ],
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            _buildPostList(posts),
            _buildGroupList(context),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  Widget _buildPostList(List<Post> posts) {
    return Scaffold(
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
                    title: Text(post.title),
                   // subtitle: Text(post.description),
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
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: InkWell(
              onTap: () {
                // Handle tapping on a group (if needed)
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/200/200'),
                ),
                title: Text(group.name + " (${group.groupId})"),
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

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        _showFloatingActionButtonOptionsDialog(context);
      },
      child: Icon(Icons.add),
    );
  }

  void _showFloatingActionButtonOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Options"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showAddPostDialog(context);
                },
                child: Text("Add New Post"),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showGroupOptionsDialog(context);
                },
                child: Text("Group Options"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddPostDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Post"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _newPostTitleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: _newPostDescriptionController,
                decoration: InputDecoration(labelText: "Description"),
              ),
              TextField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: "Image Url"),
              ),
              TextField(
                controller: _groupIdController,
                decoration: InputDecoration(labelText: "Group Id"),
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
                _addNewPost();
                Navigator.of(context).pop();
              },
              child: Text("Add Post"),
            ),
          ],
        );
      },
    );
  }

  void _addNewPost() {
    // Retrieve values from controllers and add a new post to Firebase
    String title = _newPostTitleController.text;
    String description = _newPostDescriptionController.text;
    String imageUrl = _imageUrlController.text;
    String groupId = _groupIdController.text;

    // Ensure that all required fields are filled
    if (title.isNotEmpty && description.isNotEmpty && groupId.isNotEmpty) {
      // Generate a unique post ID
      String postId = _postsRef.push().key ?? "";
      String url = "https://images.pexels.com/photos/18231968/pexels-photo-18231968/free-photo-of-close-up-of-flowers.jpeg?auto=compress";
      if(imageUrl.isNotEmpty) url = imageUrl;

      // Create a new post object
      Post newPost = Post(
        title: title,
        description: description,
        timestamp: DateTime.now(),
        imageUrl: url, // Add the image URL if available
        groupId: groupId, // Use the post ID as the group ID for simplicity
      );

      // Add the new post to the 'posts' node in Firebase
      _postsRef.child(postId).set(newPost.toJson());
      _clearInputs();
      _fetchPosts();
    }
  }

  void _showGroupOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Group Options"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showAddGroupDialog(context);
                },
                child: Text("Create New Group"),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showJoinGroupDialog(context);
                },
                child: Text("Join Existing Group"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Create New Group"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _newGroupNameController,
                decoration: InputDecoration(labelText: "Group Name"),
              ),
              TextField(
                controller: _newGroupImageController,
                decoration: InputDecoration(labelText: "Image Url"),
              ),
              // Add any other fields needed for creating a group
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
                _createNewGroup();
                Navigator.of(context).pop();
              },
              child: Text("Create Group"),
            ),
          ],
        );
      },
    );
  }

  void _createNewGroup() {
    // Retrieve values from controllers and add a new group to Firebase
    String group = _newGroupNameController.text;
    String image = _newGroupImageController.text;
    // Add any other fields needed for creating a group

    // Ensure that the group ID is not empty
    if (group.isNotEmpty) {
      String randomString = _generateRandomString(3);
      String groupId = group.toLowerCase().trim() + randomString;

      Group newGroup = Group(
        name: group, // Replace with the actual group name
        groupId: groupId,
        imageUrl: image, // Replace with the actual image URL
      );

      // Add the new group to the 'groups' node in Firebase
      _groupsRef.child(group).set(newGroup.toJson());
      _clearInputs();
      _fetchGroups();
    }
  }

  void _showJoinGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Join Existing Group"),
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
                _joinExistingGroup();
                Navigator.of(context).pop();
              },
              child: Text("Join Group"),
            ),
          ],
        );
      },
    );
  }
  void _joinExistingGroup() {
    // Retrieve values from controllers and join an existing group in Firebase
    String groupId = _groupIdController.text;

    // Ensure that the group ID is not empty
    if (groupId.isNotEmpty) {
      // Implement logic to check if the group exists in Firebase
      // ...

      // Implement logic to join the group (e.g., add the user to the group members)
      // ...
    }
  }
  void _clearInputs() {
    _newGroupNameController.clear();
    _newGroupImageController.clear();
    _groupIdController.clear();
    _imageUrlController.clear();
    _newPostTitleController.clear();
    _newPostDescriptionController.clear();
  }
  String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }
}
