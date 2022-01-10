import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/provider/real_state_provider.dart';
import 'package:state_business/utils/real_state.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/widget/custom_app_bar.dart';
import 'package:state_business/widget/elevated_container.dart';
import 'package:state_business/widget/real_state_icon.dart';
import 'package:state_business/widget/titlecontainer.dart';

class AddRealState extends StatefulWidget {
  const AddRealState({Key? key}) : super(key: key);

  @override
  _AddRealStateState createState() => _AddRealStateState();
}

class _AddRealStateState extends State<AddRealState> {
  late Responsive _responsive;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _responsive = Responsive(
      context,
    );
  }

  double _calculateWrapSpacing(int listLength, int iconSize) {
    double totalWidth = _responsive.responsiveWidth(forUnInitialDevices: 80);
    return (totalWidth -
            (listLength > 4 ? 4 : listLength) *
                _responsive.responsiveWidth(
                    forUnInitialDevices: iconSize.toDouble())) /
        (listLength > 4 ? 4 : listLength);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          responsive: _responsive,
          barTitle: 'Add Real State',
          titleContainerHeight:
              _responsive.responsiveHeight(forUnInitialDevices: 6),
          titleContainerWidth:
              _responsive.responsiveWidth(forUnInitialDevices: 40)),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/f704f24d2e8f340035a8695ff286872f.png',
                ))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              ElevatedContainer(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          saleState.length,
                          (index) => RealStateIcon(
                              textCondition:
                                  Provider.of<RealStateProvider>(context)
                                      .selectedState,
                              responsive: _responsive,
                              text: saleState[index]))),
                  height: _responsive.responsiveHeight(forUnInitialDevices: 19),
                  width: _responsive.responsiveWidth(forUnInitialDevices: 90)),
              SizedBox(
                height: _responsive.responsiveHeight(forUnInitialDevices: 4),
              ),
              Visibility(
                visible: Provider.of<RealStateProvider>(context).openBusiness,
                child: ElevatedContainer(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            businessState.length,
                            (index) => RealStateIcon(
                                textCondition:
                                    Provider.of<RealStateProvider>(context)
                                        .selectedBusiness,
                                responsive: _responsive,
                                text: businessState[index]))),
                    height:
                        _responsive.responsiveHeight(forUnInitialDevices: 19),
                    width:
                        _responsive.responsiveWidth(forUnInitialDevices: 90)),
              ),
              SizedBox(
                height: _responsive.responsiveHeight(forUnInitialDevices: 4),
              ),
              Visibility(
                visible:
                    Provider.of<RealStateProvider>(context).openContracting &&
                        Provider.of<RealStateProvider>(context).openBusiness,
                child: ElevatedContainer(
                    padding: EdgeInsets.all(
                        _responsive.responsiveWidth(forUnInitialDevices: 5)),
                    child: Wrap(
                        alignment: WrapAlignment.start,
                        runSpacing: _responsive.responsiveHeight(
                            forUnInitialDevices: 3),
                        spacing: _calculateWrapSpacing(
                            Provider.of<RealStateProvider>(context)
                                .shownList
                                .length,
                            12),
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            Provider.of<RealStateProvider>(context)
                                .shownList
                                .length,
                            (index) => RealStateIcon(
                                textCondition:
                                    Provider.of<RealStateProvider>(context)
                                        .selectedContracting,
                                iconSize: 12,
                                responsive: _responsive,
                                text: Provider.of<RealStateProvider>(context)
                                    .shownList[index]))),
                    // height: _responsive.responsiveHeight(forUnInitialDevices: 19),
                    width:
                        _responsive.responsiveWidth(forUnInitialDevices: 90)),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: Provider.of<RealStateProvider>(context)
                            .openContracting &&
                        Provider.of<RealStateProvider>(context).openBusiness &&
                        Provider.of<RealStateProvider>(context)
                                .selectedContracting !=
                            ''
                    ? () {
                        Navigator.of(context).pushReplacementNamed('FlatPage');
                      }
                    : null,
                child: TitleContainer(
                    height: 0.06,
                    width: 0.3,
                    text: 'Next',
                    color: iconColor,
                    textColor: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
