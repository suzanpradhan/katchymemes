import 'package:flutter/material.dart';
import 'package:katchymemes/screens/tab_screens/invite_screen.dart';
import 'package:katchymemes/screens/tab_screens/recent_screen.dart';
import 'package:katchymemes/screens/tab_screens/trending_screen.dart';
import 'package:katchymemes/widgets/header.dart';
import 'package:katchymemes/widgets/tab_items.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with TickerProviderStateMixin{

  TabController _tabController;

  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(handleTabSelection);
  }

  void handleTabSelection(){
    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: "KATCHYMEMES",),
        Container(
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: TabItem(
                  title: "Recent",
                  color: _tabController.index == 0 ? Colors.white : Colors.black,
                ),
              ),
              Tab(
                child: TabItem(
                  title: "Trending",
                  color: _tabController.index == 1 ? Colors.white : Colors.black
                ),
              ),
              Tab(
                child: TabItem(
                  title: "Invite",
                  color: _tabController.index == 2 ? Colors.white : Colors.black
                ),
              ),
            ],
            indicatorPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            indicator: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              RecentTab(),
              TrendingTab(),
              InviteTab(),
            ],
          )
        )
      ],
    );
  }
}

