import 'package:flutter/material.dart';
import 'package:katchymemes/screens/tab_screens/invite_screen.dart';
import 'package:katchymemes/screens/tab_screens/recent_screen.dart';
import 'package:katchymemes/screens/tab_screens/trending_screen.dart';

class HomeScreen extends StatefulWidget {
  Function navigator;
  HomeScreen({required this.navigator});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(handleTabSelection);
  }

  void handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "KATCHY MEMES",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Text("Recent"),
                      Text("Trending"),
                      Text("Invite")
                      // Tab(
                      //   child: TabItem(
                      //     title: "Recent",
                      //     color: _tabController.index == 0
                      //         ? Colors.white
                      //         : Color(0xff707070),
                      //   ),
                      // ),
                      // Tab(
                      //   child: TabItem(
                      //       title: "Trending",
                      //       color: _tabController.index == 1
                      //           ? Colors.white
                      //           : Color(0xff707070)),
                      // ),
                      // Tab(
                      //   child: TabItem(
                      //       title: "Invite",
                      //       color: _tabController.index == 2
                      //           ? Colors.white
                      //           : Color(0xff707070)),
                      // ),
                    ],
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    // indicatorPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    labelColor: Colors.white,
                    unselectedLabelColor: Color(0xff0d0d0d),
                    labelStyle: TextStyle(fontSize: 16),
                    indicator: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ],
            )),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            RecentTab(),
            TrendingTab(),
            InviteTab(),
          ],
        ))
      ],
    );
  }
}
