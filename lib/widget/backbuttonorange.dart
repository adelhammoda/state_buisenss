import 'package:flutter/material.dart';
import 'package:state_business/utils/theme.dart';


class BackbuttonOrange extends StatelessWidget {
  void Function()? onTap;
   BackbuttonOrange({this.onTap});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap ?? () {
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: EdgeInsets.only(
            right: screenWidth * 0.05,
            top: screenWidth * 0.01,
            left: screenWidth * 0.01),
        child: Row(
          // mainAxisAlignment: AppLocalizations.of(context)!.localeName=="ar"? MainAxisAlignment.end:MainAxisAlignment.start,
          children: [
            Container(
              height: 27,
              width: 27,
              padding: const EdgeInsets.all(5),
              // child: Image.asset("Images/Client/Icons/backbuttonWhite.png"),
              child: Image.asset("assets/icons/arrow.png"),
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 15,
                    spreadRadius: -5,
                    color: grayColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
