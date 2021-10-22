import 'package:flutter/material.dart';
import 'package:snapchat_ui/theme/colors.dart';
import 'package:video_player/video_player.dart';

class StoryDetailPage extends StatefulWidget {
  final String videoUrl;

  const StoryDetailPage({Key key, this.videoUrl}) : super(key: key);

  @override
  _StoryDetailPageState createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          // _controller.play();//not playing video on start
          _controller.setVolume(1);
          _controller.setLooping(false);
        }
      });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      // appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: primary,
      ),
      child: GestureDetector(
        onTap: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else if (!_controller.value.isPlaying) {
            _controller.play();
          }
        },
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: VideoPlayer(_controller),
            ),
            if (!_controller.value.isPlaying) ...{
              Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: Icon(Icons.play_arrow_rounded),
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
