// import 'package:barber_app/GlobalVariables.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// DatabaseReference appearanceref = FirebaseDatabase.instance.reference().child("Members");
Color primaryColor =const Color(0xFFFFB74D);
// getColors(newObject) async {
//    print(newObject.memberType);
//     await appearanceref.child(newObject.memberType).child(newObject.userUniqueId).child("Settings").child("Theme").child("Appearancere").child('primaryColor').get().then((DataSnapshot snapshot) {
//     if(snapshot.exists)
//     {
//         String valueString =  snapshot.value.split('(0x')[1].split(')')[0];
//         int value = int.parse(valueString, radix: 16);
//         primaryColor = Color(value);
//         print("primaryColor$primaryColor");
//     }
//   });
// }
/* Colors*/
Color iconColor = const Color(0xffF49C45);
Color whiteColor = Colors.white;
Color activeColor=const Color(0xff706e6e);
Color blackColor = Colors.black;
Color grayColor = Colors.grey;
Color darkBorder=const Color(0xFF707070);
Color hintTextColor = const Color(0xFFACACAC);
Color textFieldColor =const Color(0xFFF8F6F6);
Color redColor = Colors.red;
Color containersColor =const  Color(0xFFEBEBEA);
Color longTextColor =const  Color(0xFF023047);
List<Color> paidColors = [
  primaryColor,
 whiteColor,
];
double generalBorderRadius = 14;
double IconborderRadius = 7;
double textfieldsRadius = 14;
double itemsRadius = 7;
double searchContainerRadius = 7;
//Decoration
double? borderRadius;
int? containerColor;
double? blurRadius;
double? spreadRadius;
Decoration containerDecorations = BoxDecoration(
  color: containerColor == null ? whiteColor : Color(containerColor!),
  borderRadius: BorderRadius.circular(
    borderRadius == null ? generalBorderRadius : borderRadius!,
  ),
  boxShadow: [
    BoxShadow(
      offset: const Offset(0, 5),
      blurRadius: blurRadius == null ? 15 : blurRadius!,
      spreadRadius: spreadRadius == null ? -9 : spreadRadius!,
      color: grayColor,
    ),
  ],
);

/* TextStyles*/
TextStyle userName = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 11,
);
TextStyle titleContainerText = TextStyle(
  color: darkBorder,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
TextStyle addbuttonText = TextStyle(
  color: whiteColor,
  fontWeight: FontWeight.bold,
  fontSize: 8,
);
TextStyle salonName = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 11,
);
TextStyle phonwNummberText = TextStyle(
  fontSize: 11,
  fontFamily: 'AileronBold',
  fontWeight: FontWeight.bold,
  color: blackColor,
);
TextStyle textWithIconStyle = TextStyle(
  fontSize: 10,
  fontFamily: 'AileronBold',
  fontWeight: FontWeight.bold,
  color: whiteColor,
);
TextStyle textunderIconStyle = TextStyle(
  fontSize: 12,
  fontFamily: 'AileronBold',
  fontWeight: FontWeight.bold,
  color: primaryColor,
);
TextStyle longTextStyle =
    TextStyle(fontSize: 12.0, color: longTextColor);
TextStyle userNameHeader = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
TextStyle businesName = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 11,
);
TextStyle serviceName = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 11,
);
TextStyle likesStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 12,
);
TextStyle priceStyle = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);
TextStyle headerStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);
TextStyle timeStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 8,
);
TextStyle dateStyle = TextStyle(fontSize: 11, color: Colors.black,fontWeight: FontWeight.bold,);
TextStyle totalStyle = TextStyle(fontSize: 10, color: primaryColor,fontWeight: FontWeight.bold,);

/////////////////////////////////////
TextStyle iconsText = TextStyle(
  color: grayColor,
  fontWeight: FontWeight.bold,
  fontSize: 11,
);
TextStyle smallText = TextStyle(
  color: const Color(0xFF023047),
  fontSize: 8,
);
TextStyle dropdownText = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 11,
);
TextStyle mediconsText = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 8,
);
TextStyle smalliconsText = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 7,
);
TextStyle likesText = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 12,
);
TextStyle starText = TextStyle(
  color: blackColor,
  fontSize: 8,
);

TextStyle headers = TextStyle(
  color: primaryColor,
  //fontWeight: FontWeight.bold,
  fontSize: 15,
);

TextStyle smallUserName = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 11,
);
TextStyle joinus =
    TextStyle(color: primaryColor, fontWeight: FontWeight.bold);
TextStyle generalText =
    TextStyle(color: primaryColor, fontWeight: FontWeight.bold);
TextStyle videoText = TextStyle(color: whiteColor, fontSize: 12);
TextStyle searchTextStyle =
    TextStyle(fontSize: 12.0, color: primaryColor);

TextStyle buttonText = TextStyle(
  fontSize: 19,
  fontFamily: 'AileronBold',
  color: whiteColor,
);

TextStyle monthText = TextStyle(
    fontSize: 12,
    fontFamily: 'AileronBold',
    color: blackColor,
    fontWeight: FontWeight.bold);
TextStyle heraders = TextStyle(
  fontSize: 18,
  fontFamily: 'AileronBold',
  color: Colors.black,
);
TextStyle yearText = TextStyle(
  fontSize: 12,
  fontFamily: 'AileronBold',
  fontWeight: FontWeight.bold,
  color: blackColor,
);
TextStyle criteriaText = TextStyle(
  fontSize: 15,
  fontFamily: 'AileronBold',
  fontWeight: FontWeight.bold,
  color: blackColor,
);
TextStyle dayNameStyle = TextStyle(fontSize: 15, color: Colors.black);
TextStyle normalStyle =
    TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black);
TextStyle soSmallStyle =
    TextStyle(fontSize: 7, fontWeight: FontWeight.w800, color: Colors.black);
TextStyle soSmallStyleam = TextStyle(fontSize: 7, color: Colors.white);
TextStyle globalText =
    TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold);
