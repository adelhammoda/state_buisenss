


import 'package:firebase_database/firebase_database.dart';

class StateBusinessServer {
  final FirebaseDatabase _firebaseDatabase=FirebaseDatabase.instance;
  final String route;
  late final DatabaseReference ref=_firebaseDatabase.ref(route,);
  StateBusinessServer({required this.route});


  Future<bool> pushData(Map<String,dynamic> data){
   return ref.push().set(data ).then((value) => true).catchError((e)=>false);
  }


}