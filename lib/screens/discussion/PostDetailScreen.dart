import 'package:flutter/material.dart';
import 'package:rise/common/util.dart';
import 'LikeShareCounter.dart';
import 'Post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                height: 200,
                child: Image.network(
                  post.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              post.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeShareCounter(
                  initialLikeCount: post.likeCount,
                  initialShareCount: post.shareCount,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4),
                    Text(
                      formatDate(post.timestamp),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: CommentList(),
            ),
            CommentInput(),
          ],
        ),
      ),
    );
  }
}

class CommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your list of comments with proper data types
    final List<Map<String, dynamic>> comments = [
      {'text': 'Sample Comment 1', 'timestamp': DateTime.now()},
      {'text': 'Sample Comment 2', 'timestamp': DateTime.now()},
      {'text': 'Sample Comment 3', 'timestamp': DateTime.now()},
      {'text': 'Sample Comment 4', 'timestamp': DateTime.now()},
      {'text': 'Sample Comment 5', 'timestamp': DateTime.now()},
      {'text': 'Sample Comment 6', 'timestamp': DateTime.now()},
      // Add more comments here
    ];

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Card( // Wrap each comment in a Card
          margin: EdgeInsets.symmetric(vertical: 4.0), // Adjust vertical margin
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0), // Adjust the horizontal padding
            title: Text(comment['text'].toString()),
            subtitle: Text(formatDate(comment['timestamp'] as DateTime)),
          ),
        );
      },
    );
  }
}

class CommentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: Colors.pink),
              onPressed: () {
                // Handle sending the comment here
                // You can add the new comment to the CommentList
              },
            ),
          ],
        ),
      ),
    );
  }
}
