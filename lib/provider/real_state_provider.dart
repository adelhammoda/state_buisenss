import 'package:flutter/cupertino.dart';
import 'package:state_business/models/common_state.dart';
import 'package:state_business/models/flat.dart';
import 'package:state_business/utils/real_state.dart';

class RealStateProvider with ChangeNotifier {
  CommonState state = Flat();
  String selectedState = '';
  String selectedBusiness = '';
  String selectedContracting = '';
  bool openBusiness = false;
  bool openContracting = false;
  List<String> shownList = [];
  bool canEdit = false;

  void deleteImage(int index) {
    state.imageURL.removeAt(index);
    notifyListeners();
  }

  void addImage(String url) {
    state.imageURL.add(url);
    notifyListeners();
  }

  void changeSelectedState(String stateName) {
     if(saleState.contains(stateName)){
      selectedState =selectedState.compareTo(stateName) == 0? '':stateName;
      if (selectedState != '') {
        openBusiness = true;
      } else {
        openBusiness = false;
      }
      notifyListeners();
    }
    else {
       if (businessState.contains(stateName)) {
      selectedBusiness =
          selectedBusiness.compareTo(stateName) == 0 ? '' : stateName;
      for (int index = 0; index < businessState.length; index++) {
        if (selectedBusiness.compareTo(businessState[index]) == 0) {
          shownList = List.from(chosseList[index]);
        }
      }
      if (selectedBusiness != '') {
        openContracting = true;
      } else {
        openContracting = false;
      }
      notifyListeners();
      // return;
    } else if (residential.contains(stateName) ||commercial.contains(stateName) ) {
      selectedContracting =
          selectedContracting.compareTo(stateName) == 0 ? '' : stateName;
      notifyListeners();
      // return;
    } else {
      return ;
    }
     }

    notifyListeners();
  }
}
