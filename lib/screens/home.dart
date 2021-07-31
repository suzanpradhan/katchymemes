import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katchymemes/blocs/uploadBloc/uploadbloc_bloc.dart';
import 'package:katchymemes/screens/navigation_screens/home_screen.dart';
import 'package:katchymemes/screens/navigation_screens/notification_screens.dart';
import 'package:katchymemes/screens/navigation_screens/post_screen.dart';
import 'package:katchymemes/screens/navigation_screens/profile_screens.dart';
import 'package:katchymemes/screens/navigation_screens/search_screens.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  late List<Widget> _navigationScreens;

  @override
  void initState() {
    super.initState();
    _navigationScreens = <Widget>[
      HomeScreen(),
      SearchScreen(),
      PostScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];
    this._currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UploadblocBloc(),
          child: PostScreen(),
        ),
      ],
      child: Scaffold(
          body: SafeArea(
            child: _navigationScreens[_currentIndex],
            bottom: false,
          ),
          bottomNavigationBar: CustomNavigationBar(
            currentIndex: _currentIndex,
            selectedColor: Colors.pink,
            unSelectedColor: Colors.grey,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              CustomNavigationBarItem(icon: Icon(EvaIcons.homeOutline)),
              CustomNavigationBarItem(icon: Icon(EvaIcons.searchOutline)),
              CustomNavigationBarItem(icon: Icon(EvaIcons.plusCircleOutline)),
              CustomNavigationBarItem(icon: Icon(EvaIcons.bellOutline)),
              CustomNavigationBarItem(icon: Icon(EvaIcons.personOutline)),
            ],
          )),
    );
  }
}
