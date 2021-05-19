import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../service/http_request.dart';

class ZYHomeContent extends StatefulWidget {
  @override
  _ZYHomeContentState createState() => _ZYHomeContentState();
}

class _ZYHomeContentState extends State<ZYHomeContent> {
  @override
  void initState() {
    super.initState();
    print("首页内容开始");
    // test();
    ZYHttpRequest.request("/get")
        .then((res) {
      print(res);
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("首页内容",style: TextStyle(fontSize: 30),),
    );
  }
}
