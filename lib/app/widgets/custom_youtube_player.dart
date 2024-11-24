import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatelessWidget {
  const CustomYoutubePlayer({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: id!,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
      ),
      showVideoProgressIndicator: true,
      onEnded: (YoutubeMetaData metaData) {
        Navigator.pop(context);
      },
    );
  }
}
