

import 'package:flutter/material.dart';
import 'package:state_business/utils/inner_shadow.dart';

class CustomDropDownMenu extends StatefulWidget {
  final Widget hint;
  final List<String> items;
  final double width;
  final Function(String? object) onChanged;

  const CustomDropDownMenu(
      {Key? key,
      required this.hint,
      required this.items,
      required this.onChanged,
      this.width=20})
      : super(key: key);

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String? _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      offset: const Offset(1, 1),
      color: const Color(0xff000000).withOpacity(0.1),
      blur: 3,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xffF8F6F6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          width:widget.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20, vertical: 0),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: Container(),
              value: _dropDownValue,
              hint: widget.hint,
              icon: Image.asset('assets/icons/Polygon 58.png'),
              borderRadius: BorderRadius.circular(15),
              items: widget.items
                  .map((text) => DropdownMenuItem(
                        child: Text(text),
                        value: text,
                        onTap: () {
                          setState(() {
                            _dropDownValue=text;
                          });
                        },
                      ))
                  .toList(),
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
