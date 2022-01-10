import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/models/common_state.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/view/result.dart';
import 'package:state_business/widget/elevated_container.dart';

class ResultCard extends StatelessWidget {
  final Responsive responsive;
  final CommonState state;
  const ResultCard({Key? key, required this.responsive,required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: responsive.responsiveHeight(forUnInitialDevices: 2)),
      child: ElevatedContainer(
        padding:
            EdgeInsets.all(responsive.responsiveValue(forUnInitialDevices: 2)),
        width: responsive.responsiveWidth(forUnInitialDevices: 94),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: responsive.responsiveWidth(forUnInitialDevices: 17),
                  height: responsive.responsiveWidth(forUnInitialDevices: 17),
                  decoration: BoxDecoration(
                      color: iconColor, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.only(
                      left: responsive.responsiveWidth(forUnInitialDevices: 1)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:state.imageURL.isNotEmpty? Image.file(File(
                        state.imageURL[0],),
                        fit: BoxFit.fill,
                      ):null),
                ),
                const Spacer(),
                SizedBox(
                  height: responsive.responsiveWidth(forUnInitialDevices: 17),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        state.data['date'],
                        style: TextStyle(
                            fontSize: responsive.responsiveValue(
                                forUnInitialDevices: 2.5)),
                      ),
                      const Spacer(),
                      SizedBox(
                          width:
                              responsive.responsiveWidth(forUnInitialDevices: 75),
                          child:  Text(
                              state.data['description'])),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Container(
                width: responsive.responsiveWidth(forUnInitialDevices: 90),
                height: 2,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    ResultButton(
                      responsive: responsive,
                      imageURl: 'assets/icons/Union 40.png',
                      width: 9,
                      height: 9,
                    ),
                     SizedBox(
                      width: responsive.responsiveWidth(forUnInitialDevices: 3),
                    ),
                    ResultButton(
                      responsive: responsive,
                      imageURl: 'assets/icons/Exclusion 21.png',
                      width: 9,
                      height: 9,
                    ),
                  ],
                ),
                SizedBox(
                  width: responsive.responsiveWidth(forUnInitialDevices: 50),
                  child: Wrap(
                    runSpacing: 10,
                    spacing: responsive.responsiveWidth(forUnInitialDevices: 3),
                    children: [
                      ResultButton(
                        responsive: responsive,
                        text:state.data['area m2'].toString(),
                        width: 15,
                        imageURl: '',
                        height: 7,
                        fontSize: responsive.responsiveValue(forUnInitialDevices: 2.5),
                      ), ResultButton(
                        responsive: responsive,
                        text: state.data['title'],
                        imageURl: 'assets/icons/Union 40.png',
                        width: 30,
                        fontSize: responsive.responsiveValue(forUnInitialDevices:2.5),
                        height: 7,
                      ), ResultButton(
                        responsive: responsive,
                        text: state.data['NumberOfFloor'],
                        imageURl: 'assets/icons/Union 40.png',
                        width:  15,
                        fontSize: responsive.responsiveValue(forUnInitialDevices: 2.5),
                        height: 7,
                      ), ResultButton(
                        responsive: responsive,
                        text:  state.data['price'].toString(),
                        imageURl: 'assets/icons/Union 40.png',
                        width: 20,
                        fontSize: responsive.responsiveValue(forUnInitialDevices: 2.5),
                        height: 7,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
