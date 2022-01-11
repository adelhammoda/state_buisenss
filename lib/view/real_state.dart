import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/provider/real_state_provider.dart';
import 'package:state_business/utils/flat_options.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/view/review.dart';
import 'package:state_business/widget/careerWidget.dart';
import 'package:state_business/widget/conditional_widget.dart';
import 'package:state_business/widget/custom_app_bar.dart';
import 'package:state_business/widget/custom_switch_button.dart';
import 'package:state_business/widget/textfield_container.dart';
import 'package:state_business/widget/titlecontainer.dart';

class FlatPage extends StatefulWidget {
  const FlatPage({Key? key}) : super(key: key);

  @override
  _FlatPageState createState() => _FlatPageState();
}

class _FlatPageState extends State<FlatPage> {
  late Responsive _responsive;
  late RealStateProvider _provider;
  late List<String> _dataKey = _provider.state.data.keys.toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _responsive = Responsive(context);
    _provider = Provider.of<RealStateProvider>(context);
    print(_provider.selectedContracting);
  }

  void _onSubmitted() {
    _provider.state.data['date'] = _provider.state.addCurrentDate();
    if (_provider.state.validate()) {
      _provider.canEdit = true;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider.value(
                child: const Review(),
                value: _provider,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
            onBackButtonPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            barTitle: _provider.selectedContracting,
            titleContainerHeight:
                _responsive.responsiveWidth(forUnInitialDevices: 10),
            titleContainerWidth:null,
            //     _responsive.responsiveWidth(forUnInitialDevices: 20),
            responsive: _responsive),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        _responsive.responsiveWidth(forUnInitialDevices: 5)),
                child: Column(children: [
                  SizedBox(
                    width: double.infinity,
                    height:
                        _responsive.responsiveHeight(forUnInitialDevices: 3),
                  ),
                  Wrap(
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    children: [

                      ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('price'),
                          trueCase: TextFieldContainer(
                            errorMsg: 'This field is requierd',
                            formkey: GlobalKey(),
                            fillcolor: textFieldColor,
                            suffixIcon:SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 0.05),) ,

                            width: 0.4,
                            height: 0.06,
                            hintText: 'Price',
                            onChanged: (value) {
                              _provider.state.data['price'] = value;
                            },
                          )),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('area m2(net)'),
                        trueCase: TextFieldContainer(
                          errorMsg: 'This field is requierd',
                          formkey: GlobalKey(),
                          suffixIcon:SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 0.05),) ,

                          fillcolor: textFieldColor,
                          width: 0.4,
                          height: 0.06,
                          onChanged: (value) {
                            _provider.state.data['area m2(net)'] = value;
                          },
                          hintText: 'Area m2(net)',
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('area m2'),
                        trueCase: TextFieldContainer(
                          hintText: 'Area m2',
                          errorMsg: 'This field is requierd',
                          formkey: GlobalKey(),
                          suffixIcon:SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 0.05),) ,

                          fillcolor: textFieldColor,
                          width: 0.4,
                          height: 0.06,
                          onChanged: (value) {
                            _provider.state.data['area m2'] = value;
                          },
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('NumberOfFloor'),
                        trueCase: TextFieldContainer(
                          onChanged: (value){
                            _provider.state.data['NumberOfFloor'] = value;
                          },
                          hintText: 'NumberOfFloor',
                          errorMsg: 'This field is requierd',
                          formkey: GlobalKey(),
                          suffixIcon:SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 0.05),) ,

                          fillcolor: textFieldColor,
                          width: 0.4,
                          height: 0.06,
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('Banyo Number'),
                        trueCase: TextFieldContainer(
                          hintText: 'Banyo Number',
                          errorMsg: 'This field is requierd',
                          formkey: GlobalKey(),
                          fillcolor: textFieldColor,
                          width: 0.4,
                          height: 0.06,
                          onChanged: (value){
                            _provider.state.data['Banyo Number'] = value;
                          },
                          suffixIcon:SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 0.05),) ,

                        ),
                      ),
                    ],
                  ),
                  _VerticalSpacer(_responsive),
                  //all switch buttons
                  Wrap(
                    runSpacing: 20,
                    children: [
                      ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('balkon'),
                          trueCase: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFieldContainer(
                                onChanged: (value){
                                  _provider.state.data['Balkon'] = value;
                                },
                                enabled: false,
                                hintText: 'Balkon',
                                errorMsg: 'This field is requierd',
                                formkey: GlobalKey(),
                                fillcolor: textFieldColor,
                                width: 0.2,
                                height: 0.05,
                              ),
                              CustomSwitchButton(
                                onChanged: (value) {
                                  _provider.state.data['balkon'] = value;
                                },
                              )
                            ],
                          )),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('furnished'),
                        trueCase: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFieldContainer(
                              onChanged: (value){
                                _provider.state.data['furnished'] = value;
                              },
                              enabled: false,
                              hintText: 'Furnished',
                              errorMsg: 'This field is requierd',
                              formkey: GlobalKey(),
                              fillcolor: textFieldColor,
                              width: 0.2,
                              height: 0.05,
                            ),
                            CustomSwitchButton(
                              onChanged: (value) {
                                _provider.state.data['furnished'] = value;
                              },
                            )
                          ],
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('empty'),
                        trueCase: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFieldContainer(
                              onChanged: (value){
                                _provider.state.data['empty'] = value;
                              },
                              hintText: 'Empty',
                              errorMsg: 'This field is requierd',
                              formkey: GlobalKey(),
                              fillcolor: textFieldColor,
                              width: 0.2,
                              enabled: false,
                              height: 0.05,
                            ),
                            CustomSwitchButton(
                              onChanged: (value) {
                                _provider.state.data['empty'] = value;
                              },
                            )
                          ],
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('kredit'),
                        trueCase: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFieldContainer(
                              hintText: 'kredit',
                              errorMsg: 'This field is requierd',
                              formkey: GlobalKey(),
                              fillcolor: textFieldColor,
                              width: 0.2,
                              enabled: false,
                              height: 0.05,
                            ),
                            CustomSwitchButton(
                              onChanged: (value) {
                                _provider.state.data['kredit'] = value;
                              },
                            )
                          ],
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('takas'),
                        trueCase: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFieldContainer(
                              onChanged: (value){
                                _provider.state.data['takas'] = value;
                              },
                              hintText: 'Takas',
                              errorMsg: 'This field is requierd',
                              formkey: GlobalKey(),
                              fillcolor: textFieldColor,
                              width: 0.2,
                              enabled: false,
                              height: 0.05,
                            ),
                            CustomSwitchButton(
                              onChanged: (value) {
                                _provider.state.data['takas'] = value;
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  _VerticalSpacer(_responsive),
                  // all expanded list 'number of rooms'
                  ConditionalWidget(
                    paddingValue: 0.1,
                    condition: () => _dataKey.contains('numberOfRooms'),
                    trueCase: CareerWidget(
                      width: 0.1,
                      onTap: (value){
                        _provider.state.data['numberOfRooms'] = value;
                      },
                      spacing:_responsive.responsiveWidth(forUnInitialDevices:5),
                      fontSize: 12,
                      radius:5,
                      // height: _responsive.responsiveHeight(forUnInitialDevices: 6),
                      hintText: 'Number of Rooms',
                      items: numberOfRoom,
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                    paddingValue: 0.1,
                    condition: () => _dataKey.contains('age'),
                    trueCase: CareerWidget(
                      radius: 7,
                      items: age,
                      width: 0.1,
                      onTap: (value) {

                          _provider.state.data['age'] = value;

                      },
                      spacing:
                          _responsive.responsiveWidth(forUnInitialDevices: 2),
                      hintText: 'Age',
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                    paddingValue: 0.4,
                    condition: () => _dataKey.contains('floorType'),
                    trueCase: CareerWidget(
                      radius: 7,
                      items: floorType,
                      width: 0.2,
                      onTap: (value) {
                          _provider.state.data['floorType'] = value;
                      },
                      fontSize: 14,
                      spacing:
                          _responsive.responsiveWidth(forUnInitialDevices: 2),
                      hintText: 'Floor Type',
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                    paddingValue: 0.1,
                    condition: () => _dataKey.contains('heating'),
                    trueCase: CareerWidget(
                      radius: 7,
                      items: heating,
                      width: 0.16,
                      onTap: (value) {
                          _provider.state.data['heating'] = value;
                      },
                      fontSize: 13,
                      spacing:
                          _responsive.responsiveWidth(forUnInitialDevices: 2),
                      hintText: 'heating',
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                    paddingValue: 0.1,
                    condition: () => _dataKey.contains('tabu'),
                    trueCase: CareerWidget(
                      radius: 7,
                      items: tabuMode,
                      width: 0.16,
                      // subTitle: _provider.state.data['tabu'],
                      onTap: (value) {
                          _provider.state.data['tabu'] = value;
                      },
                      fontSize: 13,
                      spacing:
                          _responsive.responsiveWidth(forUnInitialDevices: 2),
                      hintText: 'Tabu',
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                    paddingValue: 0.1,
                    condition: () => _dataKey.contains('from'),
                    trueCase: CareerWidget(
                      hintText: 'Form',
                      spacing:_responsive.responsiveWidth(forUnInitialDevices: 5) ,
                      radius: 7,
                      items: from,
                      width: 0.15,
                      fontSize: 15,
                      // subTitle: _provider.state.data['from'],
                      onTap: (value) {
                          _provider.state.data['from'] = value;
                      },
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                      condition: () => _dataKey.contains('location'),
                      paddingValue: 0,
                      trueCase: TextFieldContainer(
                        hintText: 'Location',
                        //TODO:change this images
                        suffixIcon:  Image.asset('assets/icons/Exclusion 22.png'),
                        errorMsg: 'This field is requierd',
                        formkey: GlobalKey(),
                        fillcolor: textFieldColor,
                        width: 0.9,
                        onChanged: (value){
                          _provider.state.data['location']=value;
                        },
                        height: 0.07,
                      )),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                      condition: () => _dataKey.contains('title'),
                      paddingValue: 0,
                      trueCase: TextFieldContainer(
                          suffixIcon:SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 0.07),) ,
                        onChanged: (value){
                          _provider.state.data['title']=value;
                        },
                        hintText: 'Title',
                        errorMsg: 'This field is requierd',
                        formkey: GlobalKey(),
                        fillcolor: textFieldColor,
                        width: 0.9,
                        height: 0.07,
                      )),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                      condition: () => _dataKey.contains('description'),
                      paddingValue: 0,
                      trueCase: TextFieldContainer(
                        onChanged: (value){
                          _provider.state.data['description']=value;
                        },
                        hintText: 'Description',
                        errorMsg: 'This field is requierd',
                        formkey: GlobalKey(),
                        fillcolor: textFieldColor,
                        width: 0.9,
                        height: 0.1,
                        maxLines: 6,
                      )),
                  _VerticalSpacer(_responsive),
                  InkWell(
                    onTap: _onSubmitted,
                    child: TitleContainer(
                        height: 0.06,
                        width: 0.3,
                        text: 'Next',
                        color: iconColor,
                        textColor: Colors.white),
                  ),
                ]))));
  }
}

class _VerticalSpacer extends StatelessWidget {
  final Responsive responsive;

  const _VerticalSpacer(this.responsive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsive.responsiveHeight(forUnInitialDevices: 2),
    );
  }
}
