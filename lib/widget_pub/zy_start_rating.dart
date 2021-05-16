
import 'package:flutter/material.dart';

class ZYStartRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int startCount;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  final Widget unselectedImage;
  final Widget selectedImage;

  ZYStartRating(this.rating,
      {this.maxRating = 10,
        this.startCount = 5,
        this.size = 50,
        this.unselectedColor = const Color(0xffbbbbbb),
        this.selectedColor = const Color(0xffff0000),
        Widget unselectedImage,
        Widget selectedImage}): unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselectedColor, size: size),
        selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  _ZYStartRatingState createState() => _ZYStartRatingState();
}

class _ZYStartRatingState extends State<ZYStartRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(children: buildUnselectedStar(), mainAxisSize: MainAxisSize.min),
        Row(children: buildSelectedStar(), mainAxisSize: MainAxisSize.min)
      ],
    );
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(widget.startCount, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar() {
    Widget startWidget = widget.selectedImage;

    List<Widget> starList = [];

    //  单个星星的分值
    double singleStarValue = (widget.maxRating / widget.startCount);

    //  计算满星数量
    int entireCount = (widget.rating / singleStarValue).floor();

    for (int i = 0; i < entireCount; i++) {
      starList.add(startWidget);
    }

    //  计算不满星的占比
    double halfStarWidth =
        (widget.rating / singleStarValue - entireCount) * widget.size;

    Widget halfWidget =
    ClipRect(clipper: ZYStarClipper(halfStarWidth), child: startWidget);
    starList.add(halfWidget);

    if(starList.length > widget.startCount){
      starList = starList.sublist(0,widget.startCount);
    }

    return starList;
  }
}

class ZYStarClipper extends CustomClipper<Rect> {
  double width;

  ZYStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(ZYStarClipper oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper.width != width;
  }
}