//
// import 'package:flutter/material.dart';
// import 'package:state_business/utils/theme.dart';
//
// careerWidget() {
//   final screenHeight = MediaQuery.of(context).size.height;
//   final screenWidth = MediaQuery.of(context).size.width;
//   return AnimatedContainer(
//     height:
//     _height == null ? MediaQuery.of(context).size.height * 0.09 : _height,
//     width: MediaQuery.of(context).size.width * 0.815,
//     duration: Duration(milliseconds: 400),
//     child: SingleChildScrollView(
//       physics: NeverScrollableScrollPhysics(),
//       child: Column(
//         children: [
//           Container(
//             child: TextFieldContainer(
//               readOnly: true,
//               hintText: careerString=="Career"?AppLocalizations.of(context)!.career:careerString,
//               presuffixIcon: Padding(
//                 padding: EdgeInsets.only(right:AppLocalizations.of(context)!.localeName=="ar"?screenWidth*0.05:0),
//                 child: Image.asset("Images/Shared/Icons/career.png",color: primaryColor,height: 17,width: 17,),
//               ),
//               formkey: _formkey,
//               fillcolor: textFieldColor,
//               controller: careerNameController,
//               errorMsg: AppLocalizations.of(context)!.errorMsg,
//               keyboardType: TextInputType.text,
//               onChanged: (value) {
//                 setState(() {
//                   careerString = value;
//                   temp = careerList
//                       .where((element) => (element['name'].contains(value) ||
//                       element['name'].contains(value.toUpperCase()) ||
//                       element['name'].contains(value.toLowerCase())))
//                       .toList();
//
//                 });
//               },
//               onTap: () {
//                 setState(() {
//                   _show = hide;
//                   _show = !_show;
//                   _height =
//                   _height == MediaQuery.of(context).size.height * 0.09 ||
//                       _height == null
//                       ? MediaQuery.of(context).size.height * 0.371
//                       : MediaQuery.of(context).size.height * 0.09;
//                   if (_show = true) {
//                     setState(() {
//                       temp = List.from(careerList);
//                     });
//                   }
//                 });
//               },
//               validator: (String? value) {
//                 if (careerString == "Career") {
//                   return '';
//                 }
//                 return null;
//               },
//             ),
//           ),
//           if (_show)
//             Container(
//               width: MediaQuery.of(context).size.width * 1,
//               height: MediaQuery.of(context).size.height * 0.24,
//               decoration: BoxDecoration(
//                 color: whiteColor,
//                 borderRadius: BorderRadius.circular(7),
//               ),
//               child: ListView.builder(
//                   itemBuilder: (context, index) =>
//                       careerItem(temp.sublist(index * 5), false),
//                   itemCount: ((temp.length / 5) + 0.4).round().toInt()),
//             )
//         ],
//       ),
//     ),
//   );
// }