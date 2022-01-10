import 'package:flutter/material.dart';
import 'package:state_business/utils/theme.dart';

class ElevatedContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final double radius;
  final EdgeInsets? padding;
  final BoxBorder? boxBorder;
  const ElevatedContainer(
      {Key? key,
      required this.child,
      this.radius = 25,
       this.height,
       this.width,
      this.padding,
      this.boxBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: child,
      padding: padding,
      decoration: BoxDecoration(
        border: boxBorder,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: grayColor.withOpacity(0.5),
              offset: const Offset(0, 1),
          blurRadius: 10,
          spreadRadius: 0,)
        ],
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
