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
  List<Map<String, String>> shownList = [];
  bool canEdit = false;

  void deleteImage(int index) {
    state.imageURL.removeAt(index);
    notifyListeners();
  }

  void addImage(String url) {
    state.imageURL.add(url);
    notifyListeners();
  }

  bool checkIfContain(String str, List<Map<String, String>> data) {
    bool res = false;
    for (var element in data) {
      if (element['name']?.compareTo(str) == 0) {
        res = true;
        break;
      }
    }
    return res;
  }

  void changeSelectedState(String stateName) {
    if (checkIfContain(stateName, saleState)) {
      selectedState = selectedState.compareTo(stateName) == 0 ? '' : stateName;
      if (selectedState != '') {
        openBusiness = true;
      } else {
        openBusiness = false;
        openContracting = false;
        shownList=[];
        selectedContracting='';
        selectedBusiness='';
      }
      notifyListeners();
    }
    else {
      if ( checkIfContain(stateName, businessState)) {
        selectedBusiness =
        selectedBusiness.compareTo(stateName) == 0 ? '' : stateName;
        for (int index = 0; index < businessState.length; index++) {
          if (selectedBusiness.compareTo(
              businessState[index]['name'] ?? '--') == 0) {
            shownList = List.from(chosseList[index]);
          }
        }
        if (selectedBusiness != '') {
          openContracting = true;
        } else {
          openContracting = false;
          selectedContracting='';
          shownList=[];
        }
        notifyListeners();
        // return;
      } else
      if (checkIfContain(stateName, residential) ||checkIfContain(stateName, commercial) ) {
        selectedContracting =
        selectedContracting.compareTo(stateName) == 0 ? '' : stateName;
        notifyListeners();
        // return;
      } else {
        return;
      }
    }

    notifyListeners();
  }
}
