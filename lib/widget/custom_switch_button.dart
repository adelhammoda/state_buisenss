import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/utils/theme.dart';

class CustomSwitchButton extends StatefulWidget {
  final Function(bool val)? onChanged;

  const CustomSwitchButton({Key? key, this.onChanged}) : super(key: key);

  @override
  _CustomSwitchButtonState createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool _switchValue = false;
late Responsive _responsive;
@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _responsive=Responsive(context);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _responsive.responsiveWidth(forUnInitialDevices: 18),
      child: Switch(
        value: _switchValue,
        activeColor: iconColor,
        inactiveTrackColor:activeColor ,
        onChanged: (val) {
          widget.onChanged?.call(val);
          setState(() {
            _switchValue = val;
          });

        },
      ),
    );
  }
}
