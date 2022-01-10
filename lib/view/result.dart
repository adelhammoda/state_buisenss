import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/models/common_state.dart';
import 'package:state_business/provider/real_state_provider.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/widget/backbuttonorange.dart';
import 'package:state_business/widget/elevated_container.dart';
import 'package:state_business/widget/result_card.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late Responsive _responsive;
  List<CommonState> result=[];
@override
  void initState() {
    super.initState();

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _responsive = Responsive(context);
    //TODO: replace this with database result.
    result.add(Provider.of<RealStateProvider>(context).state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackbuttonOrange(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity,),
          ElevatedContainer(
              width: _responsive.responsiveWidth(forUnInitialDevices: 90),
              height: _responsive.responsiveWidth(forUnInitialDevices: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ResultButton(responsive: _responsive,
                      imageURl: 'assets/icons/Union 259.png',
                      isOrange: false),
                  ResultButton(responsive: _responsive,
                    imageURl: 'assets/icons/Group 3087.png',),
                  ResultButton(responsive: _responsive,
                    imageURl: 'assets/icons/Group 3088.png',),
                  ResultButton(responsive: _responsive,
                    imageURl: 'assets/icons/Exclusion 23.png',),
                ],
              )),
          Expanded(
            child: ListView.builder(itemCount: result.length,itemBuilder: (context, index) => ResultCard(
              responsive: _responsive,
              state: result[index],
            )),
          ),

        ],
      ),
    );
  }
}

class ResultButton extends StatelessWidget {
  const ResultButton({
    Key? key,
    required Responsive responsive,
    required this.imageURl,
    this.text,
    this.fontSize=10,
    this.isOrange = true, this.width , this.height = 10,
  })
      : _responsive = responsive,
        super(key: key);

  final Responsive _responsive;
  final String imageURl;
  final bool isOrange;
  final double? width;
  final double height;
  final String? text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          _responsive.responsiveValue(forUnInitialDevices: 1)),
      decoration: BoxDecoration(

          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1
            )
          ],
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffF9F7F6)),
      width:width!=null? _responsive.responsiveWidth(
          forUnInitialDevices: width!):width,
      height: _responsive.responsiveWidth(
          forUnInitialDevices: height),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: isOrange ? null : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                tileMode: TileMode.mirror,
                colors: [
                  Color(0xffF9F7F6),
                  Colors.white,
                ]),
            borderRadius: BorderRadius.circular(8),
            color: isOrange ? iconColor : Colors.white),
        child: text == null ? Image.asset(imageURl,):Text(text!,style: TextStyle(
          fontSize: fontSize
        ),),
      ),
    );
  }
}
