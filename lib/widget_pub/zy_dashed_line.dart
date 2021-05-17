import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ZYDashedLine extends StatefulWidget {
  final double size; //大小，水平时代表宽，垂直时代表高
  final double height; //高度，虚线的厚度
  final double lineWidth; //虚线的宽度
  final double gapWidth; //间隔的宽度
  final Color lineColor;
  final Color gapColor;
  final Axis direction;
  int _count;

  ZYDashedLine({
    @required this.size,
    this.height = 1,
    this.lineWidth = 2,
    this.gapWidth = 1,
    this.lineColor = Colors.lightGreenAccent,
    this.gapColor = Colors.transparent,
    this.direction = Axis.horizontal,
  });

  @override
  _ZYDashedLineState createState() => _ZYDashedLineState();
}

class _ZYDashedLineState extends State<ZYDashedLine> {
  @override
  @override
  Widget build(BuildContext context) {
    widget._count = calculateCount();

    double width = widget.size;
    double height = widget.height;
    if (widget.direction == Axis.vertical) {
      width = widget.height;
      height = widget.size;
    }

    return Container(
      child: Flex(
        direction: widget.direction,
        children: dashedList(),
        mainAxisSize: MainAxisSize.min,
      ),
      width: width,
      height: height,
    );
  }

  //  获取虚线列表
  List<Widget> dashedList() {
    double lineWidth = widget.lineWidth;
    double lineHeight = widget.height;
    double gapWidth = widget.gapWidth;
    double gapHeight = widget.height;
    double lineGapHeight = lineWidth + gapWidth;
    double lastLineWidth = widget.size - lineGapHeight;
    double lastLineHeight = widget.height;
    if (widget.direction == Axis.vertical) {
      lineWidth = widget.height;
      lineHeight = widget.lineWidth;
      gapWidth = widget.height;
      gapHeight = widget.gapWidth;
      lineGapHeight = lineHeight + gapHeight;
      lastLineWidth = widget.height;
      lastLineHeight = widget.size - lineGapHeight;
    }
    List<Widget> list = [];
    SizedBox lineBox = buildLineBox(lineWidth, lineHeight);
    SizedBox gapBox = buildGapBox(gapWidth, gapHeight);

    if (this.widget._count == 1) {
      list.add(lineBox);
      list.add(gapBox);
    } else {
      lastLineWidth = widget.size - lineGapHeight * this.widget._count;
      if (widget.direction == Axis.vertical) {
        lastLineHeight = widget.size - lineGapHeight * this.widget._count;
        lastLineWidth = widget.height;
      }

      for (int i = 0; i < this.widget._count; i++) {
        list.add(lineBox);
        list.add(gapBox);
      }
    }

    SizedBox halfWidget = buildLineBox(lastLineWidth, lastLineHeight);
    list.add(halfWidget);
    return list;
  }

  int calculateCount() {
    int count = (widget.size / (widget.gapWidth + widget.lineWidth)).floor();
    return count;
  }

  // 线
  SizedBox buildLineBox(double width, double height) {
    return SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(color: widget.lineColor),
        ));
  }

  //  间隙
  SizedBox buildGapBox(double width, double height) {
    return SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(color: widget.gapColor),
        ));
  }
}
