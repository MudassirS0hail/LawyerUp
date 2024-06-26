import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:iec_project/models/user_model.dart';
// import 'package:iec_project/pages/company_posts.dart';
import 'package:iec_project/pages/job_seekers.dart';
import 'package:iec_project/pages/posts.dart';
import 'package:iec_project/pages/settings.dart';
import 'package:iec_project/pages/user_profile.dart';
import 'package:iec_project/pages/chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> userModelLish = [];
  int index = 0;
  final screens = const [
    JobSeekers(),
    ChatPage(),
    // Company(),
    Posts(),
    UserProfile(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              // indicatorColor: Colors.blue.shade300,
              indicatorColor: const Color(0xFF2C5364),
              labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 15, color: Colors.white))),
          child: NavigationBar(
              // backgroundColor: Colors.blue[900],
              backgroundColor: const Color(0xFF203A43),
              selectedIndex: index,
              onDestinationSelected: (index) {
                setState(() {
                  this.index = index;
                });
              },
              destinations: const [
                NavigationDestination(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 25,
                    ),
                    label: "Lawyers"),
                NavigationDestination(
                    icon: Icon(
                      Icons.chat,
                      color: Colors.white,
                      size: 25,
                    ),
                    label: "Chat"),
                NavigationDestination(
                    icon: Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                      size: 25,
                    ),
                    //     label: "Law Firms"),
                    // NavigationDestination(
                    //     icon: Icon(
                    //       CupertinoIcons.book,
                    //       color: Colors.white,
                    //       size: 25,
                    //     ),
                    label: "Jobs"),
                NavigationDestination(
                    icon: Icon(
                      CupertinoIcons.profile_circled,
                      color: Colors.white,
                      size: 25,
                    ),
                    label: "Profile"),
                NavigationDestination(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 25,
                    ),
                    label: "Settings"),
              ]),
        ),
      ),
    );
  }
}
