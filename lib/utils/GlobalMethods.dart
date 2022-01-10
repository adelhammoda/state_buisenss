import 'package:intl/intl.dart';

class GlobalMethods {
  String date = " ";
  String time = " ";
  String fullDate = " ";
  getCurrentFullDate() {
    final now = DateTime.now();
    String fullDate = DateFormat('yyyy-MM-dd h:mm').format(now);
    return fullDate;
  }

  getTimeOnly() {
    final now = DateTime.now();
    time = DateFormat('h:mm').format(now);
    return time;
  }

  getDteOnly() {
    final now = DateTime.now();
    date = DateFormat('yyyy-MM-dd').format(now);
    return date;
  }

  getFullDateWithSeconds() {
    final now = DateTime.now();
    String fullDate = DateFormat('yyyy-MM-dd h:mm:ss').format(now);
    return fullDate;
  }
  convertToMinutes(double time){
    int hours=time.toInt();
    double minutesTemp=double.parse((time-hours).toStringAsFixed(2));
    int minutes= (minutesTemp * 100).toInt();
    hours=hours*60;
    return hours+minutes;
  }

  stringTimeToDouble(String yourTime) {
    String durationOfservices = yourTime.replaceAll(":", ".");
    return durationOfservices;
  }

  timeCalculation(List<double> timeNumbers, String finalTime) {
    double totalTime;
    String? extraHours;
    totalTime = 0;

    if (timeNumbers.length > 1) {
      for (var i = 0; i < timeNumbers.length; i++) {
        totalTime += timeNumbers[i];
      }
      String stirngtotalTime = totalTime.toStringAsFixed(2);
      String end = ".";
      int endIndex = stirngtotalTime.indexOf(end);
      String totalTimeHours =
          stirngtotalTime.toString().substring(0, endIndex).trim();

      String totalTimeMinutes =
          stirngtotalTime.toString().substring(endIndex + 1).trim();
      int hoursVar = double.parse(totalTimeMinutes) ~/ 60;
      int minutesVar = int.parse(totalTimeMinutes) % 60;

      extraHours = "$hoursVar.$minutesVar";
      totalTime = double.parse(totalTimeHours) + double.parse(extraHours);
      finalTime = totalTime.toStringAsFixed(2);
      finalTime = finalTime.length <= 4 ? "0$finalTime" : finalTime;

      print(finalTime);
    } else if (timeNumbers.length == 1) {
      totalTime = 0;
      totalTime += timeNumbers[0];
      finalTime = totalTime.toStringAsFixed(2);
      finalTime = finalTime.length <= 4 ? "0$finalTime" : finalTime;
    }
    return finalTime;
  }
    String getNumber(String number) {
    if (double.parse(number) >= 1000 && double.parse(number) < 1000000) {
      return (double.parse(number) / 1000).toStringAsFixed(1) + "K";
    } else if (double.parse(number) >= 1000000) {
      return (double.parse(number) / 1000000).toStringAsFixed(1) + "M";
    }
    return number;
  }
  
  timeCalculationTotalTime(double firstTime, double endTime,bool doYouWantMinus) {
    String? extraHours;
    double totalTime;
    String finalTime;
    totalTime = doYouWantMinus==false? firstTime + endTime:firstTime - endTime;
    doYouWantMinus==true?print("stotalTimes$totalTime"):null;
    doYouWantMinus==true?print("stotalTimes$firstTime"):null;
    doYouWantMinus==true?print("stotalTimes$endTime"):null;
    String stirngtotalTime = totalTime.toStringAsFixed(2);
    String end = ".";
    int endIndex = stirngtotalTime.indexOf(end);
    String totalTimeHours =stirngtotalTime.toString().substring(0, endIndex).trim();
    String totalTimeMinutes =stirngtotalTime.toString().substring(endIndex + 1).trim();
    int hoursVar = double.parse(totalTimeMinutes) ~/ 60;
    if (totalTimeMinutes != "05") {
      int minutesVar = int.parse(totalTimeMinutes) % 60;
      extraHours = "$hoursVar.$minutesVar";
      totalTime = double.parse(totalTimeHours) + double.parse(extraHours);
      finalTime = totalTime.toStringAsFixed(2);
      finalTime = finalTime.length <= 4 ? "0$finalTime" : finalTime;
      return finalTime;
    } else {
      extraHours = "$hoursVar.$totalTimeMinutes";
      totalTime = double.parse(totalTimeHours) + double.parse(extraHours);
      finalTime = totalTime.toStringAsFixed(2);
      finalTime = finalTime.length <= 4 ? "0$finalTime" : finalTime;
      return finalTime;
    }
  }

  timeMinusCalculation(double hourse, double minutes,){
    double finalMinutes=0.0;
    double totalTime=0.0;
    String finalTime;
    finalMinutes=minutes/60;
    //print("finalMinutes$finalMinutes");
    totalTime=hourse-double.parse(finalMinutes.toStringAsFixed(2));
    int endIndex = totalTime.toString().indexOf(".");
    String totalTimeMinutes= totalTime.toString().substring(endIndex + 1).trim();
    finalMinutes=double.parse("0.$totalTimeMinutes")*60;
    //print("finalMinutes$finalMinutes");
    finalTime=totalTime.toString().substring(0,endIndex+1).trim() + (finalMinutes).round().toString().replaceAll(".","");
    //print("finalMinutes$finalTime");
    return finalTime;
  }
  Duration convertStringToDuration(String duration) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> stringParts = duration.split('.');
    if (stringParts.length > 2) {
      hours = int.parse(stringParts[stringParts.length - 3]);
    }
    if (stringParts.length > 1) {
      minutes = int.parse(stringParts[stringParts.length - 2]);
    }
    micros =
        (double.parse(stringParts[stringParts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  List<Map> GenerateSchedule(String startTime,String endTime, String  restTime,String restTimeEnd) {
    List<Map> scheduleListTime=[];
    for (double i = double.parse(startTime) ; i <= double.parse(endTime);) {

      if (i>=double.parse(startTime) && i<=double.parse(restTime) ||  i>= double.parse(restTimeEnd) && i <= double.parse(endTime) ) {
        scheduleListTime.add({
          "Time": i.toStringAsFixed(2).replaceAll(".", ":"),
          "isTimeSelcted": false,
        });
      }
      i = double.parse(GlobalMethods()
          .timeCalculationTotalTime(i, 00.10,false));
    }
    //print(scheduleListTime);
    return (scheduleListTime);

  }

}

//Temp Methods 

/*
 List<Map> bookedAppointments = [
   {
    "Time": '10:00 AM',
     "isTimeSelcted": true,
   },
      {
     "Time": '14:00 PM',
     "isTimeSelcted": true,
   },
 ];

 checkifThetemexist() {
    for (var index = 0; index < bookedAppointments.length; ++index) {
     for (var amTimesSoltindex = 0;
          amTimesSoltindex < amTimesSolt.length;
          ++amTimesSoltindex) {
        if (bookedAppointments[index]["Time"] ==
            amTimesSolt[amTimesSoltindex]["Time"]) {
         amTimesSolt.removeWhere((element) =>
             element.containsValue(amTimesSolt[amTimesSoltindex]["Time"]));
          setState(() {
             amTimesSolt = amTimesSolt;
           });
         }
      }
       for (var pmTimesSoltindex = 0;
           pmTimesSoltindex < pmTimesSolt.length;
           ++pmTimesSoltindex) {
       if (bookedAppointments[index]["Time"] ==
             pmTimesSolt[pmTimesSoltindex]["Time"]) {
           pmTimesSolt.removeWhere((element) =>
               element.containsValue(pmTimesSolt[pmTimesSoltindex]["Time"]));
           setState(() {
             pmTimesSolt = pmTimesSolt;
           });
         }
       }
     }
   }

 String _textSelect(String str) {
  str = str.toString().replaceAll(".0", ":00");
  str = str.toString().replaceAll(".5", ":30");
  return str;
 }

 getHourse() {
   print("iam here");
     amTimesSolt.clear();
  for (double i = stratTime; i < restTime; i = i + 0.50) {
    amTimesSolt.add({
     "Time": "${_textSelect(i.toString())} AM",
     "isTimeSelcted": false,
       });
    }
   pmTimesSolt.clear();
     for (double i = restTime + 0.50; i <= endTime; i = i + 0.50) {
    pmTimesSolt.add({
       "Time": "${_textSelect(i.toString())} PM",
         "isTimeSelcted": false,
     });
   }
  }

*/