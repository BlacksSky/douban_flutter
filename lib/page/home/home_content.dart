import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../model/home/home_request.dart';
import '../../model/home/home_model.dart';

class ZYHomeContent extends StatefulWidget {
  @override
  _ZYHomeContentState createState() => _ZYHomeContentState();
}

class _ZYHomeContentState extends State<ZYHomeContent> {
  final List<ZYHomeListItemModel> _list = [];

  @override
  void initState() {
    super.initState();

    ZYHomeRequest.requestHotVideo(offset: 0).then((value) {
      setState(() {
        _list.addAll(value.result);
      });
    }).catchError((onError) {
      print("出错误了：$onError");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (BuildContext content, int index) {
          return Text(_list[index].author, style: TextStyle(fontSize: 20));
        },
        itemCount: _list.length,
      ),
    );
  }
}
