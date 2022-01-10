// import 'package:barber_app/Global%20Widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:state_business/utils/theme.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitleContainer extends StatefulWidget {
  double height;
  double width;
  double? borderRadiustopLeft;
  double? borderRadiustopRight;
  Color? color;
  Color? textColor;
  double? textContianerWidth;
  String? text;
  double? fontSize;
  double? allBorderRadius;
  TitleContainer({
    required this.height,
    required this.width,
    required this.text,
    this.borderRadiustopLeft,
    this.fontSize,
    this.allBorderRadius,
    this.borderRadiustopRight,
    this.textContianerWidth,
    this.color,
    this.textColor
  });

  @override
  _TitleContainerState createState() => _TitleContainerState();
}

class _TitleContainerState extends State<TitleContainer> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * widget.height,
      width: screenWidth * widget.width,
      decoration: BoxDecoration(
        color: widget.color == null ? whiteColor : widget.color!,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.borderRadiustopLeft ?? widget.allBorderRadius?? generalBorderRadius),
          topRight: Radius.circular(widget.borderRadiustopRight ?? widget.allBorderRadius?? generalBorderRadius),
          bottomLeft: Radius.circular( widget.allBorderRadius?? generalBorderRadius),
          bottomRight: Radius.circular( widget.allBorderRadius?? generalBorderRadius),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 15,
            spreadRadius: -5,
            color: grayColor,
          ),
        ],
      ),
      child: Center(
        child: widget.textContianerWidth!=null? Container(
          width: screenWidth * widget.textContianerWidth! - screenWidth * 0.04,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: Text(
                widget.text!,
                style: TextStyle(
                  color: widget.textColor??titleContainerText.color,
                  fontSize:widget.fontSize?? titleContainerText.fontSize,
                  fontWeight: titleContainerText.fontWeight
                ),
              ),
            ),
          ),
        ):Center(
              child: Text(
                widget.text!,
                style: TextStyle(
                    color: widget.textColor??titleContainerText.color,
                    fontSize: widget.fontSize?? titleContainerText.fontSize,
                    fontWeight: titleContainerText.fontWeight
                ),
              ),
            ),
      ),
    );
  }
}
