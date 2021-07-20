import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:katchymemes/screens/profile_tab_screens/profile_followers_section.dart';
import 'package:katchymemes/screens/profile_tab_screens/profile_following_screens.dart';
import 'package:katchymemes/screens/profile_tab_screens/profile_post_screens.dart';
import 'package:katchymemes/screens/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  TabController? _tabControllerForProfile;

  late int _currentTabIndex;

  List<Widget> _profileTabViews = <Widget>[
    ProfilePostScreens(),
    ProfileFollowersScreen(),
    // ProfilePostScreens(),
    ProfileFollowingScreen()
  ];

  @override
  void initState() {
    super.initState();

    _currentTabIndex = 0;
    _tabControllerForProfile = TabController(length: 3, vsync: this);
    _tabControllerForProfile!.addListener(() {
      setState(() {
        _currentTabIndex = _tabControllerForProfile!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 280,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      image: CachedNetworkImageProvider(
                          "https://images.pexels.com/photos/844297/pexels-photo-844297.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))),
            ),
          ],
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 260,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 48,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Text(
                                    "sujan_pradhan",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff707070)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 12),
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                      child: Text("Edit Profile"))
                                ],
                              ),
                            ),
                          ),
                          TabBar(
                            tabs: [
                              Text("Posts"),
                              // Text("Comments"),
                              Text("Followers"),
                              Text("Following")
                            ],
                            unselectedLabelColor: Colors.black,
                            labelColor: Colors.pink,
                            controller: _tabControllerForProfile,
                            indicatorColor: Colors.pink,
                            isScrollable: true,
                            labelPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 14),
                            indicatorSize: TabBarIndicatorSize.label,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _profileTabViews[_currentTabIndex]
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 212,
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                    radius: 48,
                  )),
            ],
          ),
        ),
        Positioned(
            top: 14,
            right: 20,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0xff0d0d0d),
                    blurRadius: 3,
                    spreadRadius: 0.1,
                    offset: Offset(0, 1))
              ], color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: IconButton(
                  icon: Icon(EvaIcons.settings2Outline),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SettingsScreen()));
                  }),
            ))
      ],
    );
  }
}
