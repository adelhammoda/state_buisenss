import 'package:flutter/material.dart';
import 'package:state_business/utils/theme.dart';

class CustomSlider extends StatefulWidget {
  final Function? onChange;
  final double max;
  final double min;

  const CustomSlider({
    Key? key,
    this.onChange,
    this.max=0,
    this.min=0,
  }) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      max: widget.max,
      min: widget.min,
      activeColor: activeColor,
      inactiveColor: activeColor,
      thumbColor: iconColor,
      value: sliderValue,
      onChanged: (value) {
        setState(() {
          sliderValue = value;
        });
        widget.onChange?.call();
      },
    );
  }
}
