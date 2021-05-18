import 'package:flutter/material.dart';

import 'initialize_items.dart';

class ZYMainPage extends StatefulWidget {
  @override
  _ZYMainPageState createState() => _ZYMainPageState();
}

class _ZYMainPageState extends State<ZYMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: pages,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: itesm,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
