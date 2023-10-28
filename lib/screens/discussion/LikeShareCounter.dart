import 'package:flutter/material.dart';

class LikeShareCounter extends StatefulWidget {
  final int initialLikeCount;
  final int initialShareCount;

  LikeShareCounter({required this.initialLikeCount, required this.initialShareCount});

  @override
  _LikeShareCounterState createState() => _LikeShareCounterState();
}

class _LikeShareCounterState extends State<LikeShareCounter> {
  late int likeCount;
  late int shareCount;

  @override
  void initState() {
    super.initState();
    likeCount = widget.initialLikeCount;
    shareCount = widget.initialShareCount;
  }

  void incrementLike() {
    setState(() {
      likeCount++;
    });
  }

  void incrementShare() {
    setState(() {
      shareCount++;
    });
  }

  void showReactionPopup(BuildContext context, RenderBox overlay, RenderBox button) {
    final reactionIcons = [Icons.thumb_up, Icons.favorite, Icons.sentiment_satisfied, Icons.sentiment_dissatisfied];
    final reactionLabels = ['Like', 'Love', 'Happy', 'Sad'];

    final buttonSize = button.size;
    final buttonPosition = button.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + buttonSize.height,
        MediaQuery.of(context).size.width - buttonPosition.dx - buttonSize.width,
        0,
      ),
      items: List.generate(reactionIcons.length, (index) {
        return PopupMenuItem<int>(
          value: index,
          child: Row(
            children: [
              Icon(reactionIcons[index], color: Colors.blue),
              SizedBox(width: 8),
              Text(reactionLabels[index]),
            ],
          ),
        );
      }),
    ).then((value) {
      if (value != null) {
        // Handle the selected reaction here
        // You can update the likeCount with the selected reaction if needed
        // For example, you can set the icon for the like button based on the selected reaction.
        // Update the likeCount and icon as needed.
        incrementLike();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: incrementLike,
          onLongPress: () {
            final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
            final RenderBox button = context.findRenderObject() as RenderBox;
            showReactionPopup(context, overlay, button);
          },
          child: Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.blue,
              ),
              SizedBox(width: 4),
              Text(likeCount.toString()),
            ],
          ),
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: incrementShare,
          child: Row(
            children: [
              Icon(
                Icons.share,
                color: Colors.green,
              ),
              SizedBox(width: 4),
              Text(shareCount.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
