
import 'package:state_business/models/common_state.dart';

class Flat implements CommonState{


  @override
  Map<String,dynamic> data={
    'price': 0.0,
    'area m2':0.0,
    'area m2(net)':0.0,
    'Banyo Number':'',
    'tabu':'',
    'from':'',
    'state':'',
    'NumberOfFloor':'',
    'numberOfRooms':'',
    'floorType':'',
    'mahele':'',
    'age':'',
    'heating':'',
    'Floor type':'',
    'location':'',
    'description':'',
    'empty':false,
    'balkon':false,
    'kredit':false,
    'takas':false,
    'furnished':false,
    'country':'',
    'city':'',
    'title':'',
    'date':'',

};

  @override
  String addCurrentDate(){
    return DateTime.now().toIso8601String();
  }

  @override
  List<String> imageURL=[];

  @override
  bool validate() {
    bool valid=true;
    data.forEach((key, value) {
      if (value is String && value==''||value is double && value==-1) {
       valid=false;
       return ;
      }
    });
    return valid;
  }


  //TODO:add location field
}
