import 'package:flutter/material.dart';
import 'package:movieapp/Browse/Browse_screen.dart';
import 'package:movieapp/Home/Home_ScreenDeatils.dart';
import 'package:movieapp/Home/Movies_home.dart';
import 'package:movieapp/Seach/search_screen.dart';
import 'package:movieapp/Watch_List/watch_list_screen.dart';

class Home_SCreen extends StatefulWidget {
  static const String Rotename = "Home_Screen";

  @override
  State<Home_SCreen> createState() => _Home_SCreenState();
}

class _Home_SCreenState extends State<Home_SCreen> {
  int Currentselect = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            Currentselect = index;
            setState(() {});
          },
          currentIndex: Currentselect,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.filter_drama), label: "BROWSE"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: "WATCHLIST"),
          ],
        ),
      ),
      body: tabs[Currentselect],
    );
  }

  List<Widget> tabs = [
    Movies_Home(),
    Search_screen(),
    Browse_screen(),
    //HomeScreenDetails(),
    WatchList_Screen(),
  ];
}
