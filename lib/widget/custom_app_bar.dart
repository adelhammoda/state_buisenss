import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/widget/titlecontainer.dart';

import 'backbuttonorange.dart';

PreferredSizeWidget customAppBar({
  Key? key,
  required double titleContainerHeight,
  required double? titleContainerWidth,
  required String barTitle,
  required Responsive responsive,
 void Function()? onBackButtonPressed,
}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: titleContainerHeight*1.5,
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BackbuttonOrange(
          onTap: onBackButtonPressed,
        ),
      ],
    ),
    titleSpacing: responsive.responsiveWidth(forUnInitialDevices: 10),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: titleContainerWidth,
            height: titleContainerHeight,
            child: TitleContainer(
              padding: EdgeInsets.all(5),
              text: barTitle,
              height: titleContainerHeight,
              width: titleContainerWidth,
              // color: ,
            )),
      ],
    ),
    backgroundColor: Colors.transparent,
    centerTitle: true,
  );
}
