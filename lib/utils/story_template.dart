import 'package:flutter/material.dart';
import 'package:snapchat_ui/pages/story_detail_page.dart';

import 'button.dart';

class StoryTemplate extends StatelessWidget {
  final String username;
  final String videoDescription;
  final String numberOfLikes;
  final String numberOfComments;
  final String numberOfShares;
  final String videoUrl;
  final int page;

  StoryTemplate({
    @required this.username,
    @required this.videoDescription,
    @required this.numberOfLikes,
    @required this.numberOfComments,
    @required this.numberOfShares,
    @required this.videoUrl,
    @required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // user post (at the very back)
          StoryDetailPage(
            videoUrl: videoUrl,
            page: page,
          ),
          // user name and caption
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment(-1, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('@' + username,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white)),
                  SizedBox(
                    height: 9,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: videoDescription,
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: ' #snapchatclone #flutter',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          // buttons
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0, right: 8.0),
            child: Container(
              alignment: Alignment(1, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    icon: Icons.favorite,
                    number: numberOfLikes,
                  ),
                  MyButton(
                    icon: Icons.chat_bubble_outlined,
                    number: numberOfComments,
                  ),
                  MyButton(
                    icon: Icons.send,
                    number: numberOfShares,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
