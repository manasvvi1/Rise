class Post {
  final String title;
  final String group;
  final String imageUrl;
  final String description;
  final DateTime timestamp;
  final int likeCount;
  final int shareCount;

  Post({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.imageUrl,
    required this.group,
    this.likeCount = 0, // Default value for likeCount
    this.shareCount = 0, // Default value for shareCount
  });
}
