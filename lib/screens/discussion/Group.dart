class Group {
  final String name;
  final String groupId;
  final String imageUrl;

  Group({
    required this.name,
    required this.groupId,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'groupId': groupId,
      'imageUrl': imageUrl
    };
  }

}