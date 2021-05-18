import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';
import '../subject/subject.dart';
import '../group/group.dart';
import '../mall/mall.dart';
import '../profile/profile.dart';


List<ZYBottomNavigationBarItem> itesm = [
  ZYBottomNavigationBarItem("home","首页"),
  ZYBottomNavigationBarItem("subject","书影音"),
  ZYBottomNavigationBarItem("group","小组"),
  ZYBottomNavigationBarItem("mall","市集"),
  ZYBottomNavigationBarItem("profile","我的"),
];

List<Widget> pages = [
  ZYHomePage(),
  ZYSubjectPage(),
  ZYGroupPage(),
  ZYMallPage(),
  ZYProfilePage(),
];