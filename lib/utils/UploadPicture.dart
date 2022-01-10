import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

import 'package:state_business/utils/GlobalMethods.dart';








class UploadPicture   with ChangeNotifier{
  final ImagePicker picker = ImagePicker();
  File? image;
  String? imageUrl;
  Reference?storagePath;
  bool completed=false;
  bool uploadCompleted=false;
  List imagesUrls=[];
  List<XFile>? imageList=[];
  List<Map> values=[];

  uploadOnePictureSignUp(Reference storagePath,XFile file) async {
        final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});
    final uploadTask =await storagePath.putFile(io.File(file.path), metadata).then((value) async {
      final link = await storagePath.getDownloadURL();
      imageUrl=link.toString();
      print(imageUrl);
      uploadCompleted=true;
      notifyListeners();
    }).catchError((onError) {
      print(onError);
    }).catchError((onError) {
      print(onError);
    });
    return imageUrl;
  }

  uploadOnePicture(Reference storagePath,source) async {
    XFile ?file = await ImagePicker().pickImage(source: source) ;
    //firebase_storage.UploadTask uploadTask;
    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file!.path});
    final uploadTask =await storagePath.putFile(io.File(file.path), metadata).then((value) async {
      final link = await storagePath.getDownloadURL();
      imageUrl=link.toString();
      print(imageUrl);
      uploadCompleted=true;
      notifyListeners();
    }).catchError((onError) {
      print(onError);
    }).catchError((onError) {
      print(onError);
    });

    return imageUrl;
  }


  uploadMultiPicture(imageStorageRef) async {
    imageList= await ImagePicker().pickMultiImage(imageQuality: 75);
    //firebase_storage.UploadTask uploadTask;
    int i=1;
    for (var element in imageList!) {
      Reference storageRef=imageStorageRef.child(GlobalMethods().getDteOnly()).child("image" +(DateTime.now().toString()));
      final metadata = firebase_storage.SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'picked-file-path': element.path});
      final uploadTask = await storageRef.putFile(io.File(element.path), metadata).then((value) async{
        final link = await storageRef.getDownloadURL();
        imageUrl=link.toString();
        imagesUrls.add(imageUrl);

        print("i $i");
        if(i==imageList!.length){
          completed=true;
          print("uploadCompleted with for loop $completed");
          notifyListeners();
        }
        i+=1;
        notifyListeners();

      }).catchError((onError) {
        print(onError);
      });

    }

    //return a;
    return imageList;
  }
  uploadMultiPictureWithImageList(imageStorageRef,List  imageList) async {
    //imageList= await ImagePicker().pickMultiImage(imageQuality: 75);
    //firebase_storage.UploadTask uploadTask;
    int i=1;
    for (var element in imageList) {
      Reference storageRef=imageStorageRef.child(GlobalMethods().getDteOnly()).child("image" +(DateTime.now().toString()));
      final metadata = firebase_storage.SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'picked-file-path': element.path});
      final uploadTask = await storageRef.putFile(io.File(element.path), metadata).then((value) async{
        final link = await storageRef.getDownloadURL();
        imageUrl=link.toString();
        imagesUrls.add(imageUrl);

        print("i $i");
        if(i==imageList.length){
          completed=true;
          print("uploadCompleted with for loop $completed");
          notifyListeners();
        }
        i+=1;
        notifyListeners();

      }).catchError((onError) {
        print(onError);
      });

    }
    return imagesUrls;
  }
}