
import 'package:flutter/material.dart';
import 'package:state_business/utils/theme.dart';

class GlobalMSGDialog extends StatefulWidget {
  final String msg1;
  final String msg2;
  final String assetpath;
  GlobalMSGDialog(this.msg1, this.assetpath, this.msg2);

  @override
  _GlobalMSGDialogState createState() => _GlobalMSGDialogState();
}

class _GlobalMSGDialogState extends State<GlobalMSGDialog> {
  String? disableMessage;
  String? deleteMessage;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(13.0))),
      insetPadding: const EdgeInsets.only(left: 14, right: 13),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              widget.assetpath,
              height: screenHeight * 0.035,
              width: screenWidth * 0.087,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              width: screenWidth * 0.65,
              child: Text(
                widget.msg1 + widget.msg2,
                style: TextStyle(fontSize: 14, color: primaryColor),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // dismiss dialog
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    primary: primaryColor,
                  ),
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }
}
