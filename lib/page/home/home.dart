import 'package:flutter/material.dart';
import 'home_content.dart';

class ZYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: ZYHomeContent(),
      backgroundColor: Color(0XFFF5F5F5),
    );;
  }
}
