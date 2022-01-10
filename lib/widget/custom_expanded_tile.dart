import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/widget/titlecontainer.dart';

class CustomExpandedTile extends StatefulWidget {
  final String title;
  final String subTitle;
  final List<String> children;
  final double? spacing;
  final double containerWidth;
  final double? runSpacing;
  final double containerHeight;
  final double? radius;
  final double? fontSize;
  final void Function(String value)? onTap;

  const CustomExpandedTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.children,
    required this.containerWidth,
    required this.containerHeight,
    this.onTap,
    this.spacing,
    this.runSpacing,
    this.radius,
    this.fontSize
  }) : super(key: key);

  @override
  _CustomExpandedTileState createState() => _CustomExpandedTileState();
}

class _CustomExpandedTileState extends State<CustomExpandedTile>
    with SingleTickerProviderStateMixin {
  late Animation<double> _offsetAnimation;
  late final AnimationController _controller;
  late Responsive _responsive;
  final GlobalKey _key = GlobalKey();
  final GlobalKey _rowKey = GlobalKey();
  Size size = const Size(0, 0);
  double height = 0;
  double initialHeight=0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      size = _rowKey.currentContext?.size ?? size;
      height = size.height;
      size = _key.currentContext?.size ?? size;
      initialHeight = size.height + height;
      height=0;
    });
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
        animationBehavior: AnimationBehavior.preserve);
    _offsetAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _responsive = Responsive(context);
  }

  void _onPressed() {

    setState(() {
      height=height==initialHeight?0:initialHeight;
      print('height is $height');
    });
    if (_controller.isCompleted) {
      _controller.reverse();
      return;
    }
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          key: _rowKey,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: _onPressed,
              child: AnimatedBuilder(
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _controller.value * pi,
                      child: child,
                    );
                  },
                  animation: _offsetAnimation,
                  child: Image.asset('assets/icons/Polygon 58.png')),
            ),
            SizedBox(
              width: _responsive.responsiveWidth(forUnInitialDevices: 80),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(widget.title), Text(widget.subTitle)],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: _responsive.responsiveWidth(forUnInitialDevices: 80),
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            )
          ],
        ),
        AnimatedContainer(
          padding: const EdgeInsets.only(top: 10),
          height: height,
          duration: const Duration(milliseconds: 400),
          child: SingleChildScrollView(
            child: Wrap(
              key: _key,
              verticalDirection: VerticalDirection.down,
              runSpacing: widget.runSpacing ?? 10,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.start,
              spacing: widget.spacing ?? 0,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: widget.children
                  .map(
                    (content) => InkWell(
                      onTap: () {
                        widget.onTap?.call(content);
                      },
                      child: TitleContainer(
                        fontSize: widget.fontSize ,
                        allBorderRadius: widget.radius,
                        height: widget.containerHeight,
                        width: widget.containerWidth,
                        text: content,
                        color: iconColor,
                        textColor: Colors.black,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
