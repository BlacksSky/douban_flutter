import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ZYDashedLine extends StatefulWidget {
  final double size; //大小，水平时代表宽，垂直时代表高
  final double height;//高度，虚线的厚度
  final double gapWidth;//间隔的宽度
  final double lineWidth;//虚线的宽度
  final Axis direction;//
  int _count;

  ZYDashedLine({
    @required this.size,
    this.height = 1,
    this.gapWidth = 1,
    this.lineWidth = 2,
    this.direction = Axis.horizontal,
  });

  @override
  _ZYDashedLineState createState() => _ZYDashedLineState();
}

class _ZYDashedLineState extends State<ZYDashedLine> {
  @override
  @override
  Widget build(BuildContext context) {
    widget._count =
        ((widget.size + widget.gapWidth) / (widget.gapWidth + widget.lineWidth))
            .floor();

    double width = widget.size;
    double height = widget.height;
    print("direction:${widget.direction},width:$width,height:$height");
    if (widget.direction == Axis.vertical) {
      width = widget.height;
      height = widget.size;
    }
    print("direction:${widget.direction},width:$width,height:$height");

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
    double width = widget.lineWidth;
    double height = widget.size;
    if (widget.direction == Axis.vertical) {
      width = widget.size;
      height = widget.lineWidth;
    }
    List<Widget> list = [];
    SizedBox lineBox = buildLineBox(width, height);
    SizedBox gapBox = buildGapBox(width, height);

    for (int i = 0; i < (this.widget._count - 1); i++) {
      list.add(lineBox);
      list.add(gapBox);
    }
    list.add(lineBox);
    return list;
  }

  // 线
  SizedBox buildLineBox(double width, double height) {
    return SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.green),
        ));
  }

  //  间隙
  SizedBox buildGapBox(double width, double height) {
    return SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.yellow),
        ));
  }
}
