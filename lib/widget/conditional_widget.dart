

import 'package:flutter/cupertino.dart';

class ConditionalWidget extends StatelessWidget {
  final Widget trueCase;
  final Widget falseCase;
  final double paddingValue;
  final bool Function()? condition;

  const ConditionalWidget(
      {Key? key,
      required this.condition,
        required this.paddingValue,
      this.falseCase = const SizedBox(),
      required this.trueCase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return condition?.call()==null||condition?.call()==true?Padding(
      padding:  EdgeInsets.symmetric(horizontal: paddingValue),
      child: trueCase,
    ):falseCase;
  }
}
