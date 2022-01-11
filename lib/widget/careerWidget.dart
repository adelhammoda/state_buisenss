import 'package:flutter/material.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/widget/textfield_container.dart';
import 'package:state_business/widget/titlecontainer.dart';

class CareerWidget extends StatefulWidget {
  // final double height;
  final String hintText;
  final List<String> items;
  final double fontSize;
  final double width;
  final double? radius;
  final double spacing;
  final Function(String value)? onTap;

  const CareerWidget({
    Key? key,
    // required this.height,
    required this.width,
    this.onTap,
    this.spacing = 20,
    this.radius,
    this.fontSize = 10,
    required this.hintText,
    required this.items,
  }) : super(key: key);

  @override
  _CareerWidgetState createState() => _CareerWidgetState();
}

class _CareerWidgetState extends State<CareerWidget> {
  double _height = 0;
  Size size = const Size(0, 0);
  double fieldHeight = 0;
  double initialHeight = 0;
  final GlobalKey _key = GlobalKey();
  final GlobalKey _fieldKey = GlobalKey();
   String? _selectedString;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      fieldHeight = _fieldKey.currentContext?.size?.height ?? 0;
      _height = fieldHeight;
      size = _key.currentContext?.size ?? size;
      print(size);
      initialHeight = size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldContainer(
          key: _fieldKey,
          readOnly: true,
          hintTextColor: _selectedString==null? null:Colors.black,
          hintText: _selectedString??widget.hintText,
          presuffixIcon: Padding(
            padding: const EdgeInsets.only(
                // right: AppLocalizations.of(context)!.localeName == "ar"
                //     ? screenWidth * 0.05
                //     : 0),
                ),
            child: Image.asset(
              "assets/icons/Polygon 58.png",
              color: primaryColor,
              height: 17,
              width: 17,
            ),
          ),
          formkey: GlobalKey(),
          fillcolor: textFieldColor,
          errorMsg: 'AppLocalizations.of(context)!.errorMsg',
          keyboardType: TextInputType.text,
          onChanged: (value) {},
          onTap: () {
            setState(() {
              _height = _height == initialHeight ? 0 : initialHeight;
              // temp = List.from(careerList);
            });
          },
        ),
        // if (_show)
        AnimatedContainer(
            height: _height,
            width: MediaQuery.of(context).size.width * 0.815,
            duration: const Duration(milliseconds: 400),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                key: _key,
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 1,
                    // height: ,
                    // padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 20,
                      spacing: widget.spacing,
                      children: widget.items
                          .map((e) => InkWell(
                                onTap: () {
                                  widget.onTap?.call(e);
                                  setState(() {
                                    _selectedString = e;
                                  });
                                },
                                child: TitleContainer(
                                  textColor: Colors.black,
                                  alignment: Alignment.center,
                                  allBorderRadius: widget.radius,
                                  height: 0.05,
                                  fontSize: widget.fontSize,
                                  color: iconColor,
                                  text: e,
                                  width: widget.width,
                                ),
                              ))
                          .toList(),
                    )),
              ),
            ))
      ],
    );
  }
}
