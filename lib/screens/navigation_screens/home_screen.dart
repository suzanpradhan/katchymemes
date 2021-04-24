import 'package:flutter/material.dart';
import 'package:katchymemes/widgets/header.dart';
import 'package:katchymemes/widgets/tab_items.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with TickerProviderStateMixin{

  TabController _tabController;

  List<Widget> _tabs = <Widget>[
     Tab(
      child: TabItem(
        title: "Recent",
      ),
    ),
    Tab(
      child: TabItem(
        title: "Trending",
      ),
    ),
    Tab(
      child: TabItem(
        title: "Invite",
      ),
    ),
  ];

  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Header(size: size),
        Container(
          width: size.width,
          child: TabBar(
            controller: _tabController,
            tabs: _tabs,
            indicatorPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
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
              Center(child: Text("Page One")),
              Center(child: Text("Page Two")),
              Center(child: Text("Page Three")),
            ],
          )
        )
      ],
    );
  }
}

