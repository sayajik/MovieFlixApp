import 'package:flutter/material.dart';
import 'package:movie_details/views/now_playing_page.dart';
import 'package:movie_details/views/top_rated_page.dart';

class TabContainerDefault extends StatefulWidget {
  @override
  _TabContainerDefaultState createState() => _TabContainerDefaultState();
}

class _TabContainerDefaultState extends State<TabContainerDefault> {
  List<Widget> listScreens;
  @override
  void initState() {
    super.initState();
    listScreens = [
      NowPlayingPage(),
      TopRatedPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(), children: listScreens),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                text: 'Now Playing',
                icon: Icon(Icons.perm_media),
              ),
              Tab(
                text: 'Top Rated',
                icon: Icon(Icons.star),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}