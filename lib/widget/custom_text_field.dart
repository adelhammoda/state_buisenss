import 'package:flutter/material.dart';
import 'package:state_business/utils/theme.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final Widget? suffix;
  final double? width;
  final bool enable;
  final double padding;
  final int maxLines;
  final int minLines;
  final double? height;
  final TextEditingController? controller;
  final Function(String? object)? onChanged;

  const CustomTextField(
      {Key? key,
      required this.hint,
      this.suffix,
      this.controller,
      this.onChanged,
      this.height,
      this.maxLines = 1,
      this.width = 20,
      this.padding = 0.3,
      this.enable = true,
      this.minLines = 1})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {

  @override
  void initState() {
    super.initState();
    // widget.controller
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff000000).withOpacity(0.2),
            blurRadius: 1,
            spreadRadius: 2,
            blurStyle: BlurStyle.outer),
        BoxShadow(
            color: const Color(0xff000000).withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 2,
            blurStyle: BlurStyle.inner)
      ], color: textFieldColor, borderRadius: BorderRadius.circular(15)),
      width: widget.width,
      height: widget.height ?? 40,
      child: TextFormField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        expands: false,
        enabled: widget.enable,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon:widget.suffix,
          prefix: Container(
            width:( widget.width ?? 1)  * widget.padding,
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          hintText: widget.hint,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
