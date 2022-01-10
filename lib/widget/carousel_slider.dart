import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/widget/titlecontainer.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> imagesUrl;
  final double height;
  final Responsive responsive;
  final double iconSize;
  final Function(int index)? deleteIconFunction;
  final Function()? onAddIconPressed;
  final double deleteIconSize;
  const CustomCarousel({
    Key? key,
    required this.imagesUrl,
    required this.height,
    required this.responsive,
    this.deleteIconFunction,
    this.onAddIconPressed,
    this.iconSize = 30,
    this.deleteIconSize=40,
  }) : super(key: key);

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (current, next) {
                setState(() {
                  _currentIndex = current + 1;
                });
              },
              viewportFraction: 1,
              height: widget.height,
            ),
            items: widget.imagesUrl
                .map((path) => Image.file(
                      File(path),
                      fit: BoxFit.fill,
                    ))
                .toList()),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            iconSize: widget.iconSize,
            icon: Image.asset(
              'assets/icons/Group 2526.png',
              fit: BoxFit.fill,
            ),
            onPressed: widget.onAddIconPressed,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: IconButton(
            iconSize:widget.deleteIconSize,
            icon: Container(
              padding:const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Image.asset(
              'assets/icons/Exclusion 21.png',
              fit: BoxFit.fill,
            )),
            onPressed:(){
              widget.deleteIconFunction?.call(_currentIndex);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: TitleContainer(
            width: 0.1,
            height: 0.04,
            allBorderRadius: 8,
            fontSize: widget.responsive.responsiveValue(forUnInitialDevices: 3),
            text: '$_currentIndex / ${widget.imagesUrl.length}',
            textColor: Colors.black,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}
