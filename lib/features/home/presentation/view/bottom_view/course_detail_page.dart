// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class CourseDetailPage extends StatefulWidget {
//   final Map<String, dynamic> course;

//   const CourseDetailPage({super.key, required this.course});

//   @override
//   State<CourseDetailPage> createState() => _CourseDetailPageState();
// }

// class _CourseDetailPageState extends State<CourseDetailPage> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     String videoId = YoutubePlayer.convertUrlToId(widget.course["videoUrl"])!;
//     _controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.course["title"])),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Course Thumbnail
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(
//                 widget.course["thumbnail"],
//                 width: double.infinity,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Course Info
//             Text(
//               widget.course["title"],
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Text(widget.course["description"],
//                 style: const TextStyle(fontSize: 16, color: Colors.grey)),

//             const SizedBox(height: 20),

//             // YouTube Video Player
//             YoutubePlayer(
//               controller: _controller,
//               showVideoProgressIndicator: true,
//               progressIndicatorColor: Colors.blueAccent,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'my_courses_provider.dart';

class CourseDetailPage extends StatefulWidget {
  final Map<String, dynamic> course;

  const CourseDetailPage({super.key, required this.course});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String videoId = YoutubePlayer.convertUrlToId(widget.course["videoUrl"])!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _buyCourse(BuildContext context) {
    Provider.of<MyCoursesProvider>(context, listen: false)
        .addCourse(widget.course);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Course Purchased!")));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var myCourses = Provider.of<MyCoursesProvider>(context).myCourses;
    bool isPurchased =
        myCourses.any((c) => c["title"] == widget.course["title"]);

    return Scaffold(
      appBar: AppBar(title: Text(widget.course["title"])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.course["thumbnail"],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(widget.course["title"],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(widget.course["description"],
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),
            YoutubePlayer(controller: _controller),
            const SizedBox(height: 20),
            isPurchased
                ? const Center(
                    child: Text("You already own this course!",
                        style: TextStyle(color: Colors.green, fontSize: 16)))
                : ElevatedButton(
                    onPressed: () => _buyCourse(context),
                    child: const Text("Buy Now"),
                  ),
          ],
        ),
      ),
    );
  }
}
