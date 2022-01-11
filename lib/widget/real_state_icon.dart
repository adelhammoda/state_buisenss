import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/provider/real_state_provider.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/widget/elevated_container.dart';

class RealStateIcon extends StatelessWidget {
  final Responsive responsive;
  final void Function()? onTap;
  final String text;
  final double iconSize;
  final String textCondition;
  final String imageLocation;
  const RealStateIcon({
    Key? key,
    required this.responsive,
    required this.imageLocation,
    required this.text,
    required this.textCondition,
    this.iconSize = 17,
    this.onTap,
  }) : super(key: key);

  void _changeStateIcon(BuildContext context, String iconName) {
    Provider.of<RealStateProvider>(context, listen: false)
        .changeSelectedState(iconName);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
        _changeStateIcon(context, text);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedContainer(
            boxBorder: textCondition == text
                ? Border.all(
                    color: darkBorder,
                  )
                : null,
            radius: 10,
            padding: EdgeInsets.all(
                responsive.responsiveWidth(forUnInitialDevices: 0.7)),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageLocation),
                  ),
                  border: textCondition == text
                      ? Border.all(
                          color: darkBorder,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(10),
                  color:textCondition != text? iconColor:grayColor),
              width: responsive.responsiveWidth(forUnInitialDevices: iconSize),
              height: responsive.responsiveWidth(forUnInitialDevices: iconSize),
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Text(
            text,
            style: TextStyle(color: darkBorder, fontSize: iconSize * 0.9),
          )
        ],
      ),
    );
  }
}
