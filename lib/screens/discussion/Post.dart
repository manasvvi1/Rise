class Post {
  final String title;
  final String imageUrl;
  final String description;
  final DateTime timestamp;
  final int likeCount;
  final int shareCount;
  final String groupId;

  Post({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.imageUrl,
    this.groupId = "",
    this.likeCount = 0,
    this.shareCount = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'timestamp': timestamp.toIso8601String(),
      'likeCount': likeCount,
      'shareCount': shareCount,
      'groupId': groupId,
    };
  }
}
