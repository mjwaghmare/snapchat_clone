import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:snapchat_ui/pages/camera_page.dart';
import 'package:snapchat_ui/pages/chat_page.dart';
import 'package:snapchat_ui/pages/discover_page.dart';
import 'package:snapchat_ui/pages/map_page.dart';
import 'package:snapchat_ui/pages/stories_page.dart';
import 'package:snapchat_ui/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

int pageIndex = 0;

class _RootAppState extends State<RootApp> {
  List<Widget> pages = [
    MapPage(),
    ChatPage(),
    CameraPage(),
    // ChatPage(),
    StoriesPage(),
    DiscoverPage(
      page: pageIndex,
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    // return pages.elementAt(pageIndex);
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List iconItems = [
      Feather.map_pin,
      MaterialIcons.chat_bubble_outline,
      Feather.camera,
      Feather.users,
      Feather.play
    ];
    List textItems = ["Map", "Chat", "Camera", "Stories", "Discover"];
    List colorItems = [
      green,
      blue,
      primary,
      purple,
      primary,
    ];
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 95,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
              top:
                  BorderSide(width: 2, color: Colors.black.withOpacity(0.06)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    Icon(iconItems[index],
                        size: 25,
                        color: pageIndex == index
                            ? colorItems[index]
                            : Colors.white.withOpacity(0.5)),
                  ],
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
