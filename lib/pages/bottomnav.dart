// ignore_for_file: prefer_const_literals_to_create_immutables, use_super_parameters, library_private_types_in_public_api, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/categories.dart';
import 'package:wallpaper_app/pages/home.dart';
import 'package:wallpaper_app/pages/search.dart';



class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;

  @override
  void initState() {
    super.initState();
    pages = [
      Home(),
      Search(),
      Categories(),
    ];
    currentPage = pages[currentTabIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        index: currentTabIndex,
        backgroundColor: Colors.white, // خلفية شريط التنقل السفلي
        color: Colors.white, // لون العنصر النشط
        buttonBackgroundColor: Colors.deepPurple, // لون الزر
        animationDuration: Duration(milliseconds: 500),
        items: <Widget>[
          Icon(Icons.home_outlined, size: 30, color: Colors.black),
          Icon(Icons.search, size: 30, color: Colors.black),
          Icon(Icons.category, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
      ),
      body: pages[currentTabIndex],
    );
  }
}
