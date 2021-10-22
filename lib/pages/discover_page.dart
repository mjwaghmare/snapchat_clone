import 'package:flutter/material.dart';
import 'package:snapchat_ui/data/stories_json.dart';
import 'package:snapchat_ui/theme/colors.dart';
import 'package:snapchat_ui/utils/story_template.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [
          StoryTemplate(
            username: 'Harry Potter',
            videoDescription: "Harry's' Video",
            numberOfLikes: '7.2M',
            numberOfComments: '12352',
            numberOfShares: '1222',
            videoUrl: stories_data[0]['videoUrl'],
          ),
          StoryTemplate(
            username: 'Black Widow',
            videoDescription: 'Show Off',
            numberOfLikes: '1.26M',
            numberOfComments: '15232',
            numberOfShares: '1225',
            videoUrl: stories_data[1]['videoUrl'],
          ),
          StoryTemplate(
            username: 'Flash',
            videoDescription: 'Run Barry Run',
            numberOfLikes: '1.6M',
            numberOfComments: '1236',
            numberOfShares: '142',
            videoUrl: stories_data[2]['videoUrl'],
          ),
        ],
      ),
    );
  }
}
