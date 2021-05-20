import 'package:douban_flutter/widget_pub/zy_dashed_line.dart';
import 'package:douban_flutter/widget_pub/zy_start_rating.dart';

import '../../model/home/home_model.dart';
import 'package:flutter/material.dart';

class ZYHomeContentItem extends StatelessWidget {
  final ZYHomeListItemModel itemModel;

  ZYHomeContentItem(this.itemModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          SizedBox(height: 8),
          buildContent(),
          SizedBox(height: 8),
          buildFooter(),
        ],
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 8, color: Colors.black12))),
    );
  }

  //  头部排名
  Widget buildHeader() {
    return Container(
      child: Text(
        "No.${itemModel.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
    );
  }

  //  中间内容
  Widget buildContent() {
    return Row(
      children: [
        buildContentImage(),
        SizedBox(width: 8),
        buildContentInfo(),
        SizedBox(width: 8),
        buildContentLint(),
        SizedBox(width: 8),
        buildContentWish(),
        SizedBox(width: 8),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  //  中间内容-图片
  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        itemModel.itemCover,
        height: 150,
      ),
    );
  }

  //  中间内容-信息
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContentInfoTitle(),
          buildContentInfoRate(),
          buildContentInfoDesc(),
        ],
      ),
    );
  }

  //  中间内容-信息-title
  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(children: [
        WidgetSpan(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.red,
              size: 24,
            ),
            alignment: PlaceholderAlignment.bottom),
        TextSpan(
            text: itemModel.title.substring(0, 3),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        TextSpan(
            text: "(${itemModel.diggCount})", style: TextStyle(fontSize: 18)),
      ]),
    );
  }

  //  中间内容-信息-评分
  Widget buildContentInfoRate() {
    return Row(
      children: [
        ZYStartRating(itemModel.rating, size: 20),
        SizedBox(width: 6),
        Text("${itemModel.rating}"),
      ],
    );
  }

  //  中间内容-信息-描述
  Widget buildContentInfoDesc() {
    return Text(
      itemModel.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget buildContentLint() {
    return ZYDashedLine(
      size: 95,
      direction: Axis.vertical,
      lineWidth: 5,
      height: 1,
      lineColor: Color.fromARGB(255, 233, 170, 60),
    );
  }

  Widget buildContentWish() {
    return Container(
      child: Column(
        children: [
          Image.asset("assets/images/home/wish.png", width: 35),
          Text("想看",
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 233, 170, 60))),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      height: 95,
    );
  }

  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0XFFEBEBEB), borderRadius: BorderRadius.circular(5)),
      child: Text(itemModel.title),
    );
  }
}
