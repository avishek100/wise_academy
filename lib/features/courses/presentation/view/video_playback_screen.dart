// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class VideoPlaybackScreen extends StatefulWidget {
//   const VideoPlaybackScreen({super.key});

//   @override
//   _VideoPlaybackScreenState createState() => _VideoPlaybackScreenState();
// }

// class _VideoPlaybackScreenState extends State<VideoPlaybackScreen> {
//   final String videoUrl = "https://www.youtube.com/watch?v=GxmfcnU3feo&t=2s";

//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? "",
//       flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
//     );
//   }

//   void _completeCourse() {
//     Navigator.popUntil(context, (route) => route.isFirst); // ✅ Redirect to Home
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Course Video"),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Enjoy Your Course!",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             YoutubePlayerBuilder(
//               player: YoutubePlayer(controller: _controller),
//               builder: (context, player) {
//                 return player;
//               },
//             ),
//             const SizedBox(height: 30),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: _completeCourse,
//                 child: const Text(
//                   "Course Completed",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlaybackScreen extends StatefulWidget {
  const VideoPlaybackScreen({super.key});

  @override
  _VideoPlaybackScreenState createState() => _VideoPlaybackScreenState();
}

class _VideoPlaybackScreenState extends State<VideoPlaybackScreen> {
  final String videoUrl = "https://www.youtube.com/watch?v=GxmfcnU3feo&t=2s";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? "",
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  void _completeCourse() {
    Navigator.popUntil(context, (route) => route.isFirst); // ✅ Redirect to Home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Video"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enjoy Your Course!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height *
                    0.4, // ✅ Use 40% of screen height
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(controller: _controller),
                  builder: (context, player) => player,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _completeCourse,
                  child: const Text(
                    "Course Completed",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
