import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CheckoutScreen extends StatelessWidget {
  final String videoUrl;

  const CheckoutScreen({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Checkout Complete"), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Thank you for your purchase!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            if (videoUrl.isNotEmpty)
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId:
                        YoutubePlayer.convertUrlToId(videoUrl) ?? "",
                    flags:
                        const YoutubePlayerFlags(autoPlay: true, mute: false),
                  ),
                ),
                builder: (context, player) {
                  return Column(children: [player]);
                },
              ),
          ],
        ),
      ),
    );
  }
}
