// import 'dart:io';
// import 'dart:math';
// import 'package:barber_app/Client/Client%20Widgets/Containers/cameraicon_container.dart';
// import 'package:barber_app/Client/Client%20Widgets/Containers/chooseimage__container.dart';
// import 'package:barber_app/Client/Client%20Widgets/Containers/global_container.dart';
// import 'package:barber_app/Client/Client%20Widgets/Containers/titlecontainer.dart';
// import 'package:barber_app/Global%20Widgets/Dialogs/globelmsgdialog.dart';
// import 'package:barber_app/Global%20Widgets/backbuttonorange.dart';
// import 'package:barber_app/Global%20Widgets/backgroundimage.dart';
// import 'package:barber_app/Global%20Widgets/button.dart';
// import 'package:barber_app/Global%20Widgets/csc_picker/csc_picker.dart';
// import 'package:barber_app/Global%20Widgets/textFields/textfield_container.dart';
// import 'package:barber_app/Global%20Widgets/theme.dart';
// import 'package:barber_app/Login+register/login.dart';
// import 'package:barber_app/UploadPictureAndPdfToStorage/UploadPicture.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:barber_app/Global%20Widgets/capitalizeExtention.dart';
// import '../GlobalVariables.dart';
//
// class SignUp extends StatefulWidget {
//   final bool isClient;
//   final bool isUpdating;
//   SignUp(this.isClient, this.isUpdating);
//   @override
//   _SignUpState createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   //Database References
//   DatabaseReference clientKey = FirebaseDatabase.instance
//       .reference()
//       .child("GlobalKey")
//       .child("Client Id");
//   DatabaseReference businessKey = FirebaseDatabase.instance
//       .reference()
//       .child("GlobalKey")
//       .child("Business Id");
//   DatabaseReference clientRef =
//       FirebaseDatabase.instance.reference().child("Members").child("Clients");
//   DatabaseReference businessRef =
//       FirebaseDatabase.instance.reference().child("Members").child("Business");
//
//   //End
//
//   //variables
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   final TextEditingController codeController = TextEditingController();
//   String firstName = " ";
//   String lastName = " ";
//   String? businessName;
//   String? vergiNumra;
//   String phoneNumber = " ";
//   String email = " ";
//   late String password;
//   int clientId = 0;
//   int businessId = 0;
//   bool checkEmail = false;
//   String? countryValue;
//   String? stateValue;
//   String? cityValue;
//   String address = "";
//   bool _show = false;
//   bool _businessshow = false;
//   bool imageUploading = false;
//   double? _height;
//   double? _businesheight;
//   late List<Map> temp;
//   String careerString = 'Career';
//   String businesstring = 'Business Type';
//   bool hide = false;
//   bool businessHide = false;
//   List<Map> careerList = [];
//   List<Map> typeList = [];
//   TextEditingController careerNameController = new TextEditingController();
//   TextEditingController businessController = new TextEditingController();
//
//   String? imageUrl;
//   XFile? profileImage;
//
//   // FirebaseStorage storage = FirebaseStorage.instance;
//   Reference signupRef = FirebaseStorage.instance.ref().child("SignUp");
//   int? groupValue;
//   bool isBusiness = false;
//   //End variables
//
//   ///Functions
//
//   //send verification code
//   // void sendCode() async {
//   //   EmailAuth.sessionName = "Barber Shop";
//   //   bool sendEmail = await EmailAuth.sendOtp(receiverMail: email);
//   //   if (sendEmail) {
//   //     showDialog(
//   //         context: context,
//   //         builder: (BuildContext context) {
//   //           return GlobalMSGDialog(
//   //             "",
//   //             "Images/Client/Icons/success-icon-10.png",
//   //             AppLocalizations.of(context)!.verificationCodeHasBeenSent,
//   //           );
//   //         });
//   //   } else {
//   //     showDialog(
//   //         context: context,
//   //         builder: (BuildContext context) {
//   //           return GlobalMSGDialog(
//   //             "",
//   //             "Images/Client/Icons/Error.png",
//   //              AppLocalizations.of(context)!.verificationCodeHasNotBeenSent,
//   //           );
//   //         });
//   //   }
//   // }
//
//   //End send verification code
// //Get ClientID
//   getClientId() {
//     clientKey.once().then((DataSnapshot snapshot) {
//       clientId = snapshot.value;
//     });
//   }
//
//   //End
//   //Get business id
//   getBusinessId() {
//     businessKey.once().then((DataSnapshot snapshot) {
//       businessId = snapshot.value;
//     });
//   }
//
//   //End
//   //Client signup
//    clientSignUP() {
//     clientRef.child("C $clientId").child("FirstName").set(firstName.capitalizeFirstofEach);
//     clientRef.child("C $clientId").child("LastName").set(lastName.capitalizeFirstofEach);
//     clientRef.child("C $clientId").child("PhoneNumber").set(phoneNumber);
//     clientRef.child("C $clientId").child("Email").set(email);
//     clientRef.child("C $clientId").child("career").set(careerString.inCaps);
//     clientRef.child("C $clientId").child("imageUrl").set(imageUrl);
//     clientRef.child("C $clientId").child("AverageRating").set(0);
//     clientRef.child("C $clientId").child("RatingCount").set(0);
//     clientRef.child("C $clientId").child("Friends").set(0);
//     clientRef.child("C $clientId").child("Likes").set(0);
//     clientRef.child("C $clientId") .child("MyInformation").child("address").child("City").set(cityValue);
//     clientRef .child("C $clientId").child("MyInformation").child("address").child("State").set(stateValue);
//     clientRef .child("C $clientId").child("MyInformation") .child("address").child("Country").set(countryValue);
//     final userRef = FirebaseFirestore.instance.collection("Users Email").doc(email);
//     userRef.set({
//       "userUniqueId": "C $clientId",
//       "memberType": "Clients",
//       "isBusiness": false
//     });
//     String fulName=firstName+" "+lastName;
//     final userAddressRef = FirebaseFirestore.instance.collection("ClientAddress").doc(countryValue).collection(stateValue!).doc(cityValue);
//     try{userAddressRef.update({"C $clientId": "$fulName"});
//     }catch(error){
//       userAddressRef.set({"C $clientId": "$fulName"});
//     }
//
//     clientId++;
//     clientKey.set(clientId);
//   }
//
//   //End Client signup
//   //Business signup
//   businessSignUP() {
//     businessRef.child("B $businessId").child("FirstName").set(firstName.capitalizeFirstofEach);
//     businessRef.child("B $businessId").child("LastName").set(lastName.capitalizeFirstofEach);
//     businessRef.child("B $businessId").child("PhoneNumber").set(phoneNumber);
//     businessRef.child("B $businessId").child("Email").set(email);
//     businessRef.child("B $businessId").child("BusinessName").set(businessName!.capitalizeFirstofEach);
//     businessRef.child("B $businessId").child("VergiNumara").set(vergiNumra);
//     businessRef.child("B $businessId").child("career").set(careerString.inCaps);
//     businessRef.child("B $businessId").child("BusinessType").set(businesstring.inCaps);
//     businessRef.child("B $businessId").child("imageUrl").set("https://firebasestorage.googleapis.com/v0/b/barberapp-9377f.appspot.com/o/SalonDef.png?alt=media&token=e6d43a3a-6556-4983-9abd-209c4a52716b");
//     businessRef.child("B $businessId").child("AverageRating").set(0);
//     businessRef.child("B $businessId").child("RatingCount").set(0);
//     businessRef.child("B $businessId").child("Likes").set(0);
//     clientRef.child("C $clientId").child("Followers").set(0);
//     businessRef.child("B $businessId").child("ClientsCounte").set(0);
//
//     businessRef.child("B $businessId").child("MyInformation").child("StartTime").set("08:00");
//     businessRef.child("B $businessId").child("MyInformation").child("EndTime").set("19:00");
//     businessRef.child("B $businessId").child("MyInformation").child("RestTime").set("13:00");
//     businessRef.child("B $businessId").child("MyInformation").child("RestTimeEnd").set("14:00");
//
//     businessRef.child("B $businessId").child("MyInformation").child("address").child("City").set(cityValue);
//     businessRef.child("B $businessId").child("MyInformation").child("address").child("State").set(stateValue);
//     businessRef.child("B $businessId").child("MyInformation").child("address") .child("Country").set(countryValue);
//     final userRef =FirebaseFirestore.instance.collection("Users Email").doc(email);
//     userRef.set({"userUniqueId": "B $businessId", "memberType": "Business"});
//     final userAddressRef = FirebaseFirestore.instance.collection("BusinessAddress").doc(countryValue).collection(stateValue!).doc(cityValue);
//     try{
//       userAddressRef.update({"B $businessId": "$businessName"});
//     }catch(error){
//       userAddressRef.set({"B $businessId": "$businessName"});
//     }
//
//     businessId++;
//     businessKey.set(businessId);
//   }
//
//   //End
//   //add user to google Auth
//   addUserToAuth(String email, String password) async {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//       setState(() {
//         checkEmail = true;
//       });
//
//       print("added to AUTH");
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//
//   }
//
//   //End
//   GlobalVariables newObject = GlobalVariables();
//   userDataFunction() async {
//     await newObject.getUserData();
//   }
//   //get clientData
//   getClientData() {
//
//     clientRef.child(newObject.userUniqueId).once().then((DataSnapshot snapshot) {
//       //.child(userUniqueId)
//       setState(() {
//         firstName = snapshot.value["FirstName"];
//         lastName = snapshot.value["LastName"];
//         email = snapshot.value["Email"];
//         phoneNumber = snapshot.value["PhoneNumber"];
//         countryValue = snapshot.value["Country"];
//         stateValue = snapshot.value["State"];
//         cityValue = snapshot.value["City"];
//         imageUrl = snapshot.value["imageUrl"];
//       });
//     });
//   }
//
//   //End
//   //get business data
//   getBusinessData() {}
//   //End
//   //add career from database
//   getCategory() async {
//     DatabaseReference categoryref = FirebaseDatabase.instance.reference()
//     .child(AppLocalizations.of(context)!.localeName=="ar"?"arCategory":AppLocalizations.of(context)!.localeName=="tr"?"trCategory":"Category");
//     careerList.clear();
//     await categoryref.once().then((DataSnapshot snapshot) {
//       Map<dynamic, dynamic> values = snapshot.value;
//       values.forEach((value, values) {
//         careerList.add({
//           'id': value,
//           'name': values["nameofCategory"],
//           'imageUrl': values["imageUrl"],
//         });
//         print("careerList$careerList");
//       });
//     });
//   }
//
//   //End
//   //add Type From DB
//   getBusinessType() async {
//     DatabaseReference typeListref =
//         FirebaseDatabase.instance.reference()
//         .child(AppLocalizations.of(context)!.localeName=="ar"?"arBusinessType":AppLocalizations.of(context)!.localeName=="tr"?"trBusinessType":"BusinessType");
//     typeList.clear();
//     await typeListref.once().then((DataSnapshot snapshot) {
//       Map<dynamic, dynamic> values = snapshot.value;
//       values.forEach((value, values) {
//         typeList.add({
//           'id': value,
//           'name': values["name"],
//           'imageUrl': values["imageUrl"],
//         });
//       });
//     });
//   }
//
//   //End
//   //genrate code
//   String code="";
//   Random _rnd = Random();
//   //static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
//   static const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
//   static const _numbers = '1234567890';
//   createCode(int length){
//     return String.fromCharCodes(Iterable.generate(
//         length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
//
//   }
//   //End
//   // add profile picture
//
//   //end
//   ///End Functions
//   @override
//   void initState() {
//     code=createCode(8);
//     ()async{
//       try{
//         await userDataFunction();
//       }catch(error){
//         print(error);
//       }
//
//       if (widget.isClient && widget.isUpdating == false) {
//         getClientId();
//       } else if (widget.isClient == false && widget.isUpdating == false) {
//         getBusinessId();
//       } else if (widget.isClient == true && widget.isUpdating == true) {
//         getClientData();
//       } else if (widget.isClient == false && widget.isUpdating == true) {
//         getBusinessData();
//       }
//       getCategory();
//       getBusinessType();
//     }();
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       //resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: backgrounImage(
//           SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 //SignUp and banner Column
//                 Column(
//                   children: [
//                     widget.isClient == false
//                         //Banner Image Stack
//                         ? Stack(
//                             children: [
//                               BackbuttonOrange(),
//                             ],
//                           )
//                         : Column(
//                             children: [
//                               BackbuttonOrange(),
//                               TitleContainer(
//                                 height: 0.06,
//                                 width: 0.4,
//                                 text: AppLocalizations.of(context)!.signIn,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 8.0),
//                                 child: clientImage(),
//                               )
//                             ],
//                           ),
//                     //Salon Name
//                     widget.isClient == false
//                         ? TitleContainer(
//                             height: 0.06,
//                             width: 0.4,
//                             text: AppLocalizations.of(context)!.signIn,
//                           )
//                         : Container(),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: screenHeight * 0.015),
//                   child: GlobalContainer(
//                     height: widget.isClient == false? 0.75:0.55,
//                     containerPadding: 8,
//                     width: 0.9,
//                     child: Form(
//                       key: _formkey,
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             //First Name TextFieldContainer
//                             TextFieldContainer(
//                                 readOnly: widget.isUpdating,
//                                 hintText: widget.isUpdating == true
//                                     ? firstName
//                                     : AppLocalizations.of(context)!.firstName,
//                                 presuffixIcon: Padding(
//                                     padding: EdgeInsets.only(right:AppLocalizations.of(context)!.localeName=="ar"?screenWidth*0.05:0),
//                                     child: Image.asset("Images/Client/Icons/name.png",color: primaryColor,height: 17,width: 17,),
//                                   ),
//                                 formkey: _formkey,
//                                 fillcolor: textFieldColor,
//                                 errorMsg:
//                                     AppLocalizations.of(context)!.errorMsg,
//                                 keyboardType: TextInputType.name,
//                                 onChanged: (value) {
//                                   firstName = value;
//                                 },
//                                 validator: (String? value) {
//                                   if (value!.isEmpty) {
//                                     return '';
//                                   }
//                                   return null;
//                                 }),
//                             //Last nameTextFieldContainer
//                             TextFieldContainer(
//                                 readOnly: widget.isUpdating,
//                                 hintText: widget.isUpdating == true
//                                     ? lastName
//                                     : AppLocalizations.of(context)!.lastName,
//                                 presuffixIcon: Padding(
//                                   padding: EdgeInsets.only(right:AppLocalizations.of(context)!.localeName=="ar"?screenWidth*0.05:0),
//                                   child: Image.asset("Images/Client/Icons/name.png",color: primaryColor,height: 17,width: 17,),
//                                 ),
//                                 formkey: _formkey,
//                                 fillcolor: textFieldColor,
//                                 errorMsg:
//                                     AppLocalizations.of(context)!.errorMsg,
//                                 keyboardType: TextInputType.name,
//                                 onChanged: (value) {
//                                   lastName = value;
//                                 },
//                                 validator: (String? value) {
//                                   if (value!.isEmpty) {
//                                     return '';
//                                   }
//                                   return null;
//                                 }),
//                             widget.isClient == false
//                                 ?
//                                 //Business name TextFieldContainer
//                                 TextFieldContainer(
//                                     readOnly: widget.isUpdating,
//                                     hintText:  AppLocalizations.of(context)!.businessName,
//                                     fillcolor: textFieldColor,
//                                     presuffixIcon: Padding(
//                                       padding: EdgeInsets.only(right:AppLocalizations.of(context)!.localeName=="ar"?screenWidth*0.05:0),
//                                       child: Image.asset("Images/Client/Icons/Businessname.png",color: primaryColor,height: 17,width: 17,),
//                                     ),
//                                     formkey: _formkey,
//                                     errorMsg:AppLocalizations.of(context)!.errorMsg,
//                                     keyboardType: TextInputType.name,
//                                     onChanged: (value) {
//                                       businessName = value;
//                                     },
//                                     validator: (String? value) {
//                                       if (value!.isEmpty) {
//                                         return '';
//                                       }
//                                       return null;
//                                     })
//                                 : Container(),
//                             //Vergi numra TextFieldContainer
//                             widget.isClient == false
//                                 ? TextFieldContainer(
//                                     readOnly: widget.isUpdating,
//                                     hintText:  AppLocalizations.of(context)!.taxNumber,
//                                     presuffixIcon: Padding(
//                                       padding: EdgeInsets.only(right:AppLocalizations.of(context)!.localeName=="ar"?screenWidth*0.05:0),
//                                       child: Image.asset("Images/Client/Icons/vergi.png",color: primaryColor,height: 17,width: 17,),
//                                     ),
//                                     formkey: _formkey,
//                                     fillcolor: textFieldColor,
//                                     errorMsg:
//                                         AppLocalizations.of(context)!.errorMsg,
//                                     keyboardType: TextInputType.text,
//                                     onChanged: (value) {
//                                       vergiNumra = value;
//                                     },
//                                     validator: (String? value) {
//                                       if (value!.isEmpty) {
//                                         return '';
//                                       }
//                                       return null;
//                                     })
//                                 : Container(),
//
//                             //phone numra TextFieldContainer
//                             TextFieldContainer(
//                               readOnly: widget.isUpdating,
//                               hintText: widget.isUpdating == true
//                                   ? phoneNumber
//                                   : AppLocalizations.of(context)!.phoneNumber,
//                                presuffixIcon: Padding(
//                                   padding: EdgeInsets.only(right:AppLocalizations.of(context)!.localeName=="ar"?screenWidth*0.05:0),
//                                   child: Image.asset("Images/Client/Icons/phone.png",color: primaryColor,height: 17,width: 17,),
//                                 ),
//                               formkey: _formkey,
//                               fillcolor: textFieldColor,
//                               errorMsg:
//                                   AppLocalizations.of(context)!.errorMsg,
//                               keyboardType: TextInputType.phone,
//                               onChanged: (value) {
//                                 phoneNumber = value;
//                               },
//                               validator: (String? value) {
//                                 if (value!.isEmpty) {
//                                   return '';
//                                 }
//                                 if (!RegExp("^[+0-9]*\$").hasMatch(value)) {
//                                   return '';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             Padding(
//                               padding:
//                                   EdgeInsets.only(top: screenHeight * 0.015),
//                               child: countryWidget(),
//                             ),
//                             careerWidget(),
//                             widget.isClient == false?
//                             businessWidget():Container(),
//                             //Email TextFieldContainer
//                             TextFieldContainer(
//                               readOnly: widget.isUpdating,
//                               hintText: widget.isUpdating == true ? email : AppLocalizations.of(context)!.email,
//                               presuffixIcon: Padding(
//                                   padding: EdgeInsets.only(right:AppLocalizations.of(context)!.localeName=="ar"?screenWidth*0.05:0),
//                                   child: Image.asset("Images/Client/Icons/Email.png",color: primaryColor,height: 17,width: 17,),
//                               ),
//                               formkey: _formkey,
//                               fillcolor: textFieldColor,
//                               errorMsg:
//                                   AppLocalizations.of(context)!.errorMsg,
//                               keyboardType: TextInputType.text,
//                               onChanged: (value) {
//                                 email = value;
//                               },
//                               validator: (String? value) {
//                                 if (value!.isEmpty) {
//                                   return '';
//                                 }
//                                 if (!RegExp(
//                                         "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                                     .hasMatch(value)) {
//                                   return '';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             //Password TextFieldContainer
//                              widget.isUpdating == false?TextFieldContainer(
//                               readOnly: widget.isUpdating,
//                               hintText: AppLocalizations.of(context)!.password,
//                               fillcolor: textFieldColor,
//                                presuffixIcon: Padding(
//                                   padding: EdgeInsets.only(right:AppLocalizations.of(context)!.localeName=="ar"?screenWidth*0.05:0),
//                                   child: Image.asset("Images/Client/Icons/password.png",color: primaryColor,height: 17,width: 17,),
//                               ),
//                               formkey: _formkey,
//                               obscureText: true,
//                               errorMsg:
//                                   AppLocalizations.of(context)!.errorMsg,
//                               keyboardType: TextInputType.text,
//                               onChanged: (value) {
//                                 password = value;
//                               },
//                               validator: (String? value) {
//                                 if (value!.isEmpty) {
//                                   return '';
//                                 }
//
//                                 return null;
//                               },
//                             ):Container(),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 padding: EdgeInsets.only(top: screenHeight * 0.015),alignment: Alignment.center,
//                                 decoration: new BoxDecoration(
//                                   color: textFieldColor,
//                                   shape: BoxShape.rectangle,
//                                   borderRadius: BorderRadius.circular(15),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black26,
//                                       blurRadius: 10.0,
//                                       offset: const Offset(0.0, 10.0),
//                                     ),
//                                   ],
//                                 ),
//                                 width: screenWidth * 0.815,
//                                  height: screenHeight*0.1,
//                                //  color:textFieldColor ,
//                                 child: Text(code,style:
//                                 GoogleFonts.shadowsIntoLight(
//                                   textStyle: Theme.of(context).textTheme.headline4,
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.w700,
//                                   fontStyle: FontStyle.italic,
//                                 ),),),
//                             ),
//                             //Activation code TextFieldContainer
//                             TextFieldContainer(
//                               hintText: AppLocalizations.of(context)!.activationCode,
//                               controller: codeController,
//                               fillcolor: textFieldColor,
//                               presuffixIcon: Padding(
//                                   padding: EdgeInsets.only(right:AppLocalizations.of(context)!.localeName=="ar"?screenWidth*0.05:0),
//                                   child: Image.asset("Images/Client/Icons/key.png",color: primaryColor,height: 17,width: 17,),
//                               ),
//                               formkey: _formkey,
//                               errorMsg:
//                                   AppLocalizations.of(context)!.errorMsg,
//                               keyboardType: TextInputType.text,
//                               suffixIcon: Padding(
//                                 padding: EdgeInsets.only(left:AppLocalizations.of(context)!.localeName=="ar"?0:26),
//                                 child: InkWell(
//                                   child: Image.asset(
//                                     "Images/Client/Icons/Getcode.png",
//                                     color: redColor,
//                                   ),
//                                   onTap: () {
//                                     setState(() {
//                                       code=createCode(8);
//                                     });
//                                     //sendCode();
//                                   },
//                                 ),
//                               ),
//                               validator: (String? value) {
//                                 if (value!.isEmpty) {
//                                   return '';
//                                 }
//                                 // if (value!.length >= 7) {
//                                 //   return '';
//                                 // }
//                                 return null;
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (widget.isUpdating)
//                   Padding(
//                     padding: EdgeInsets.only(top: screenHeight * 0.015),
//                     child: Container(
//                       width: screenWidth * 0.85,
//                       height: screenHeight * 0.06,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: ListTile(
//                               title: Text(
//                                 AppLocalizations.of(context)!.bussiness,
//                                 style: TextStyle(fontSize: 14),
//                               ),
//                               leading: Radio(
//                                 value: 1,
//                                 groupValue: groupValue,
//                                 onChanged: (int? value) {
//                                   setState(() {
//                                     groupValue = value;
//                                     isBusiness = true;
//
//                                   });
//                                 },
//                                 activeColor: Colors.green,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: ListTile(
//                               title: Text(
//                                 AppLocalizations.of(context)!.employee,
//                                 style: TextStyle(fontSize: 14),
//                               ),
//                               leading: Radio(
//                                 value: 2,
//                                 groupValue: groupValue,
//                                 onChanged: (int? value) {
//                                   setState(() {
//                                     groupValue = value;
//                                     isBusiness = false;
//
//                                   });
//                                 },
//                                 activeColor: Colors.green,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       top: screenHeight * 0.015, bottom: screenHeight * 0.015),
//                   child: imageUploading == false
//                       ? InkWell(
//                           child: button(
//                             AppLocalizations.of(context)!.submit,
//                             0.35,
//                             0.065,
//                             primaryColor,
//                             whiteColor,
//                           ),
//                           onTap: () async {
//                             if(codeController.text==code){
//                             if (widget.isUpdating) {
//                               if (widget.isClient) {
//                                 String url = await UploadPicture()
//                                     .uploadOnePictureSignUp(signupRef.child(email).child("profileImage"),
//                                         profileImage!);
//                                 setState(() {
//                                   imageUrl = url;
//                                 });
//                                 clientRef
//                                     .child("Client 10")
//                                     .child("imageUrl")
//                                     .set(imageUrl); //useruniqid
//
//                               } else {
//                                 String url = await UploadPicture()
//                                     .uploadOnePictureSignUp(
//                                         signupRef
//                                             .child(email)
//                                             .child("profileImage"),
//                                         profileImage!);
//                                 setState(() {
//                                   imageUrl = url;
//                                 });
//                               }
//                             } else {
//                               if (_formkey.currentState!.validate()) {
//                                 if (widget.isClient == true) {
//                                   if (profileImage != null) {
//                                     if (cityValue != null &&countryValue != null &&stateValue != null) {
//                                       var validateCode = true;
//                                       if (validateCode) {
//                                         if (widget.isClient) {
//                                           await addUserToAuth(email, password);
//                                           if (checkEmail) {
//                                             setState(() {
//                                               imageUploading = true;
//                                             });
//                                             String url = await UploadPicture()
//                                                 .uploadOnePictureSignUp(
//                                                     signupRef
//                                                         .child(email)
//                                                         .child("profileImage"),
//                                                     profileImage!);
//                                             setState(() {
//                                               imageUrl = url;
//                                               imageUploading = false;
//                                             });
//                                             await clientSignUP();
//                                             Navigator.push(context,
//                                                 MaterialPageRoute(builder: (context) => Login()));
//                                             showDialog(
//                                                 context: context,
//                                                 builder:
//                                                     (BuildContext context) {
//                                                   return GlobalMSGDialog(
//                                                     "",
//                                                     "Images/Client/Icons/success-icon-10.png",
//                                                     AppLocalizations.of(context)!.signUpCompleted,
//                                                   );
//                                                 });
//                                           } else {
//                                             showDialog(
//                                                 context: context,
//                                                 builder:
//                                                     (BuildContext context) {
//                                                   return GlobalMSGDialog(
//                                                     "",
//                                                     "Images/Client/Icons/Error.png",
//                                                     AppLocalizations.of(context)!.emailAlreadyExist,
//                                                   );
//                                                 });
//                                           }
//                                         } else {
//                                           setState(() {
//                                             imageUploading = true;
//                                           });
//                                           await addUserToAuth(email, password);
//                                           if (checkEmail) {
//                                             String url = await UploadPicture()
//                                                 .uploadOnePictureSignUp(
//                                                     signupRef
//                                                         .child(email)
//                                                         .child("profileImage"),
//                                                     profileImage!);
//                                             setState(() {
//                                               imageUrl = url;
//                                               imageUploading = false;
//                                             });
//                                            await businessSignUP();
//                                             Navigator.push(context,
//                                                 MaterialPageRoute(builder: (context) => Login()));
//                                             showDialog(
//                                                 context: context,
//                                                 builder:
//                                                     (BuildContext context) {
//                                                   return GlobalMSGDialog(
//                                                     "",
//                                                     "Images/Client/Icons/success-icon-10.png",
//                                                     AppLocalizations.of(context)!.signUpCompleted,
//                                                   );
//                                                 });
//                                           } else {
//                                             showDialog(
//                                                 context: context,
//                                                 builder:
//                                                     (BuildContext context) {
//                                                   return GlobalMSGDialog(
//                                                     "",
//                                                     "Images/Client/Icons/Error.png",
//                                                    AppLocalizations.of(context)!.emailAlreadyExist,
//                                                   );
//                                                 });
//                                           }
//                                         }
//                                       } else {
//                                         showDialog(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return GlobalMSGDialog(
//                                                 "",
//                                                 "Images/Client/Icons/Error.png",
//                                                 AppLocalizations.of(context)!.makeSureTheCodeIsCorrect,
//                                               );
//                                             });
//                                       }
//                                     } else {
//                                       showDialog(
//                                           context: context,
//                                           builder: (BuildContext context) {
//                                             return GlobalMSGDialog(
//                                               "",
//                                               "Images/Client/Icons/Error.png",
//                                               AppLocalizations.of(context)!.makeSureYouChoseYourAddress,
//                                             );
//                                           });
//                                     }
//                                   } else {
//                                     showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return GlobalMSGDialog(
//                                             "",
//                                             "Images/Client/Icons/Error.png",
//                                             AppLocalizations.of(context)!.pleaseUploadAnImage,
//                                           );
//                                         });
//                                   }
//                                 } else {
//
//                                   if (cityValue != null &&countryValue != null &&stateValue != null) {
//                                     var validateCode = true;
//                                     if (validateCode) {
//                                       if (widget.isClient) {
//                                         await addUserToAuth(email, password);
//                                         if (checkEmail) {
//                                           setState(() {
//                                             imageUploading = true;
//                                           });
//                                           String url = await UploadPicture()
//                                               .uploadOnePictureSignUp(
//                                                   signupRef
//                                                       .child(email)
//                                                       .child("profileImage"),
//                                                   profileImage!);
//                                           setState(() {
//                                             imageUrl = url;
//                                             imageUploading = false;
//                                           });
//                                           await clientSignUP();
//                                           Navigator.push(context,
//                                               MaterialPageRoute(builder: (context) => Login()));
//                                           showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) {
//                                                 return GlobalMSGDialog(
//                                                   "",
//                                                   "Images/Client/Icons/success-icon-10.png",
//                                                   AppLocalizations.of(context)!.signUpCompleted,
//                                                 );
//                                               });
//                                         } else {
//                                           showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) {
//                                                 return GlobalMSGDialog(
//                                                   "",
//                                                   "Images/Client/Icons/Error.png",
//                                                   AppLocalizations.of(context)!.emailAlreadyExist,
//                                                 );
//                                               });
//                                         }
//                                       } else {
//                                         await addUserToAuth(email, password);
//                                         if (checkEmail) {
//                                           await businessSignUP();
//                                           Navigator.push(context,
//                                               MaterialPageRoute(builder: (context) => Login()));
//                                           showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) {
//                                                 return GlobalMSGDialog(
//                                                   "",
//                                                   "Images/Client/Icons/success-icon-10.png",
//                                                   AppLocalizations.of(context)!.signUpCompleted,
//                                                 );
//                                               });
//                                         } else {
//                                           showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) {
//                                                 return GlobalMSGDialog(
//                                                   "",
//                                                   "Images/Client/Icons/Error.png",
//                                                   AppLocalizations.of(context)!.emailAlreadyExist,
//                                                 );
//                                               });
//                                         }
//                                       }
//                                     } else {
//                                       showDialog(
//                                           context: context,
//                                           builder: (BuildContext context) {
//                                             return GlobalMSGDialog(
//                                               "",
//                                               "Images/Client/Icons/Error.png",
//                                               AppLocalizations.of(context)!.makeSureTheCodeIsCorrect,
//                                             );
//                                           });
//                                     }
//                                   } else {
//                                     showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return GlobalMSGDialog(
//                                             "",
//                                             "Images/Client/Icons/Error.png",
//                                             AppLocalizations.of(context)!.makeSureYouChoseYourAddress,
//                                           );
//                                         });
//                                   }
//                                 }
//                               } else {
//                                 showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return GlobalMSGDialog(
//                                         "",
//                                         "Images/Client/Icons/Error.png",
//                                         AppLocalizations.of(context)!.errorMsg,
//                                       );
//                                     });
//                               }
//                             }
//
//                           }else{
//                               print("your code is not correct");
//                               showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return GlobalMSGDialog(
//                                       "",
//                                       "Images/Client/Icons/Error.png",
//                                         AppLocalizations.of(context)!.yourCodeIsNotCorrect,
//                                     );
//                                   });
//
//                             }
//                             },
//                         )
//                       : Align(
//                           alignment: Alignment.center,
//                           child: CircularProgressIndicator(
//                             color: primaryColor,
//                           ),
//                         ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   countryWidget() {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Container(
//       width: screenWidth * 0.815,
//       child: CSCPicker(
//         showCities: true, showStates: true, flagState: CountryFlag.DISABLE,
//         layout: Layout.vertical,
//
//         ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
//         disabledDropdownDecoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(textfTextFieldContainerieldsRadius)),
//             color: textFieldColor,
//             border: Border.all(color: textFieldColor, width: 0.0)),
//
//         dropdownDecoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(textfieldsRadius)),
//             color: textFieldColor,
//             border: Border.all(color: textFieldColor, width: 0.0)),
//
//         ///placeholders for dropdown search field
//         citySearchPlaceholder: AppLocalizations.of(context)!.city,
//         countrySearchPlaceholder:AppLocalizations.of(context)!.country,
//         stateSearchPlaceholder: AppLocalizations.of(context)!.state,
//
//         ///labels for dropdown
//         countryDropdownLabel: AppLocalizations.of(context)!.country,
//         stateDropdownLabel: AppLocalizations.of(context)!.state,
//         cityDropdownLabel: AppLocalizations.of(context)!.city,
//
//         ///Default Country
//         defaultCountry: DefaultCountry.Turkey,
//         selectedItemStyle: TextStyle(
//           color: hintTextColor,
//           fontSize: 14,
//         ),
//
//         ///DropdownDialog Heading style [OPTIONAL PARAMETER]
//         dropdownHeadingStyle: TextStyle(color: textFieldColor),
//
//         ///DropdownDialog Item style [OPTIONAL PARAMETER]
//         dropdownItemStyle: TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//         ),
//
//         ///Dialog box radius [OPTIONAL PARAMETER]
//         dropdownDialogRadius: 10.0,
//
//         ///Search bar radius [OPTIONAL PARAMETER]
//         searchBarRadius: 10.0,
//
//         ///triggers once country selected in dropdown
//         onCountryChanged: (value) {
//           setState(() {
//             ///store value in country variable
//             countryValue = value;
//           });
//         },
//
//         ///triggers once state selected in dropdown
//         onStateChanged: (value) {
//           setState(() {
//             ///store value in state variable
//             stateValue = value;
//           });
//         },
//
//         ///triggers once city selected in dropdown
//         onCityChanged: (value) {
//           setState(() {
//             ///store value in city variable
//             cityValue = value;
//             address = "$cityValue, $stateValue, $countryValue";
//
//           });
//         },
//       ),
//     );
//   }
//


//   businessWidget() {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return AnimatedContainer(
//       height: _businesheight == null
//           ? MediaQuery.of(context).size.height * 0.09
//           : _businesheight,
//       width: MediaQuery.of(context).size.width * 0.815,
//       duration: Duration(milliseconds: 400),
//       child: SingleChildScrollView(
//         physics: NeverScrollableScrollPhysics(),
//         child: Column(
//           children: [
//             Container(
//               width: screenWidth * 0.89,
//               child: TextFieldContainer(
//                 readOnly: true,
//                 hintText:businesstring=="Business Type"?AppLocalizations.of(context)!.businessType:careerString,
//                  presuffixIcon: Padding(
//                   padding: EdgeInsets.only(right:AppLocalizations.of(context)!.localeName=="ar"?screenWidth*0.05:0),
//                   child: Image.asset("Images/Shared/Icons/career.png",color: primaryColor,height: 17,width: 17,),
//                 ),
//                 formkey: _formkey,
//                 fillcolor: textFieldColor,
//                 controller: businessController,
//                 errorMsg: AppLocalizations.of(context)!.errorMsg,
//                 keyboardType: TextInputType.text,
//                 onChanged: (value) {
//                   setState(() {
//                     businesstring = value;
//                     temp = typeList
//                         .where((element) => (element['name'].contains(value) ||
//                             element['name'].contains(value.toUpperCase()) ||
//                             element['name'].contains(value.toLowerCase())))
//                         .toList();
//
//                   });
//                 },
//                 onTap: () {
//                   setState(() {
//                     _businessshow = businessHide;
//                     _businessshow = !_businessshow;
//                     _businesheight = _businesheight ==
//                                 MediaQuery.of(context).size.height * 0.09 ||
//                             _businesheight == null
//                         ? MediaQuery.of(context).size.height * 0.371
//                         : MediaQuery.of(context).size.height * 0.09;
//                     if (_businessshow = true) {
//                       setState(() {
//                         temp = List.from(typeList);
//                       });
//                     }
//                   });
//                 },
//                 validator: (String? value) {
//                   if (widget.isClient==false? businesstring == "Business Type":businesstring != "Business Type") {
//                     return '';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             if (_businessshow)
//               Container(
//                 width: MediaQuery.of(context).size.width * 1,
//                 height: MediaQuery.of(context).size.height * 0.24,
//                 decoration: BoxDecoration(
//                   color: whiteColor,
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//                 child: ListView.builder(
//                     itemBuilder: (context, index) =>
//                         careerItem(temp.sublist(index * 5), true),
//                     itemCount: ((temp.length / 5) + 0.4).round().toInt()),
//               )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget careerItem(List list, bool isbusinesstring) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: List.generate(
//           list.length >= 5 ? 5 : list.length,
//           (index) => buildColumn(context, list[index]['name'],
//               list[index]['imageUrl'], isbusinesstring)),
//     );
//   }
//
//   Widget buildColumn(BuildContext context, String text, String imageUrl,
//       bool isbusinesstring) {
//     return Padding(
//       padding: const EdgeInsets.all(3.5),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           InkWell(
//             onTap: isbusinesstring == false
//                 ? () {
//                     setState(() {
//                       _height = MediaQuery.of(context).size.height * 0.1;
//                       careerString = text;
//                       _show = false;
//
//                     });
//                   }
//                 : () {
//                     setState(() {
//                       _businesheight = MediaQuery.of(context).size.height * 0.1;
//                       businesstring = text;
//                       _businessshow = false;
//
//                     });
//                   },
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.1,
//               height: MediaQuery.of(context).size.height * 0.058,
//               decoration: BoxDecoration(
//                   color: primaryColor,
//                   borderRadius: BorderRadius.circular(7)),
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(7),
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Image.network(
//                       imageUrl,
//                       fit: BoxFit.contain,
//                     ),
//                   )),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 4.0),
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.14,
//               child: Center(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Text(
//                     text,
//                     softWrap: true,
//                     style: TextStyle(
//                       color: blackColor,
//                       fontSize: 8,
//                       fontFamily: "Ail",
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget clientImage() {
//     final screeHight = MediaQuery.of(context).size.height;
//     final screeWidth = MediaQuery.of(context).size.width;
//     return InkWell(
//       child: Container(
//         child: Stack(
//           children: <Widget>[
//             Container(
//               width: screeWidth * 0.37,
//               height: screeHight * 0.18,
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle, color: primaryColor),
//               padding: const EdgeInsets.all(3),
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   backgroundImage: profileImage == null
//                       ? AssetImage(
//                           "Images/Shared/Icons/Profile.png",
//                         ) as ImageProvider
//                       : FileImage(File(profileImage!.path)),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: screeWidth * 0.16,
//               bottom: screeHight * 0.01,
//               child: const Icon(
//                 Icons.camera_alt,
//                 color: Colors.white,
//                 size: 16.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//        onTap: () {
//         showModalBottomSheet(
//           context: context,
//           builder: ((builder) => chooseImage(() async {
//                 profileImage = await ImagePicker()
//                     .pickImage(source: ImageSource.camera);
//
//                 setState(() {});
//               }, () async {
//                 profileImage = await ImagePicker()
//                     .pickImage(source: ImageSource.gallery);
//
//                 setState(() {});
//               })),
//         );
//       },
//     );
//   }
// }
