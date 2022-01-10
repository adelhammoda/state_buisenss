import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/provider/real_state_provider.dart';
import 'package:state_business/server/state_buisness_server.dart';
import 'package:state_business/utils/flat_options.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/widget/conditional_widget.dart';
import 'package:state_business/widget/custom_app_bar.dart';
import 'package:state_business/widget/custom_drop_down_menu.dart';
import 'package:state_business/widget/custom_expanded_tile.dart';
import 'package:state_business/widget/custom_text_field.dart';
import 'package:state_business/widget/custom_switch_button.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _responsive = Responsive(context);
    _provider = Provider.of<RealStateProvider>(context);
  }

  void _onSubmitted() {
    _provider.state.data['date'] = _provider.state.addCurrentDate();
    if (_provider.state.validate()) {
      StateBusinessServer server = StateBusinessServer(
          route:
              '${_provider.selectedState}/${_provider.openBusiness}/${_provider.selectedContracting}/${_provider.state.data['country']}/${_provider.state.data['city']}');
      server.pushData( _provider.state.data);
    }
    _provider.canEdit = true;
    Navigator.of(context).pushReplacementNamed('review');
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
            titleContainerWidth:
                _responsive.responsiveWidth(forUnInitialDevices: 20),
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
                    runSpacing: 20,
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    children: [
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('country'),
                        trueCase: CustomDropDownMenu(
                          items: country,
                          hint: const Text('Country'),
                          onChanged: (value) {
                            _provider.state.data['country'] = value;
                          },
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 40),
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('state'),
                        trueCase: CustomDropDownMenu(
                          items: status,
                          hint: const Text('State'),
                          onChanged: (value) {
                            _provider.state.data['state'] = value;
                          },
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 40),
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('city'),
                        trueCase: CustomDropDownMenu(
                          items: city,
                          hint: const Text('City'),
                          onChanged: (value) {
                            _provider.state.data['city'] = value;
                          },
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 40),
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('mahele'),
                        trueCase: CustomDropDownMenu(
                          items: mahele,
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/icons/Subtraction 368.png'),
                              SizedBox(
                                width: _responsive.responsiveWidth(
                                    forUnInitialDevices: 2),
                              ),
                              const Text('Mahele'),
                            ],
                          ),
                          onChanged: (value) {
                            _provider.state.data['mahele'] = value;
                          },
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 40),
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('price'),
                        trueCase: CustomTextField(
                          hint: 'Price',
                          onChanged: (value) {
                            _provider.state.data['price'] = value;
                          },
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 40),
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('area m2(net)'),
                        trueCase: CustomTextField(
                          hint: 'Area(m2)(net)',
                          enable: false,
                          onChanged: (value) {
                            _provider.state.data['area m2(net)'] = value;
                          },
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 40),
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('area m2'),
                        trueCase: CustomTextField(
                          hint: 'Area(m2)',
                          enable: false,
                          onChanged: (value) {
                            _provider.state.data['area m2'] = value;
                          },
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 40),
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('NumberOfFloor'),
                        trueCase: CustomTextField(
                          hint: 'Number Of Floor',
                          enable: false,
                          padding: 0.1,
                          onChanged: (value) {
                            _provider.state.data['NumberOfFloor'] = value;
                          },
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 40),
                        ),
                      ),
                      ConditionalWidget(
                        paddingValue: _responsive.responsiveWidth(
                            forUnInitialDevices: 2.5),
                        condition: () => _dataKey.contains('Banyo Number'),
                        trueCase: CustomTextField(
                          padding: 0.1,
                          hint: 'Banyo Number',
                          enable: false,
                          onChanged: (value) {
                            _provider.state.data['Banyo Number'] = value;
                          },
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 40),
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
                              CustomTextField(
                                padding: 0.1,
                                hint: 'Balkon',
                                enable: false,
                                width: _responsive.responsiveWidth(
                                    forUnInitialDevices: 22),
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
                            CustomTextField(
                              hint: 'Furnished',
                              padding: 0.1,
                              enable: false,
                              width: _responsive.responsiveWidth(
                                  forUnInitialDevices: 22),
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
                            CustomTextField(
                              padding: 0.1,
                              hint: 'Empty',
                              enable: false,
                              width: _responsive.responsiveWidth(
                                  forUnInitialDevices: 22),
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
                            CustomTextField(
                              padding: 0.1,
                              hint: 'Kredit',
                              enable: false,
                              width: _responsive.responsiveWidth(
                                  forUnInitialDevices: 22),
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
                            CustomTextField(
                              padding: 0.1,
                              hint: 'Takas',
                              enable: false,
                              width: _responsive.responsiveWidth(
                                  forUnInitialDevices: 22),
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
                    trueCase: CustomExpandedTile(
                      radius: 7,
                      children: numberOfRoom,
                      containerWidth: 0.1,
                      subTitle: _provider.state.data['numberOfRooms'],
                      onTap: (value) {
                        setState(() {
                          _provider.state.data['numberOfRooms'] = value;
                        });
                      },
                      spacing:
                          _responsive.responsiveWidth(forUnInitialDevices: 2),
                      title: 'Number of Room',
                      containerHeight: 0.05,
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                    paddingValue: 0.1,
                    condition: () => _dataKey.contains('age'),
                    trueCase: CustomExpandedTile(
                      radius: 7,
                      children: age,
                      containerWidth: 0.15,
                      subTitle: _provider.state.data['age'],
                      onTap: (value) {
                        setState(() {
                          _provider.state.data['age'] = value;
                        });
                      },
                      spacing:
                          _responsive.responsiveWidth(forUnInitialDevices: 2),
                      title: 'Age',
                      containerHeight: 0.05,
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                    paddingValue: 0.4,
                    condition: () => _dataKey.contains('floorType'),
                    trueCase: CustomExpandedTile(
                      radius: 7,
                      children: floorType,
                      containerWidth: 0.2,
                      subTitle: _provider.state.data['floorType'],
                      onTap: (value) {
                        setState(() {
                          _provider.state.data['floorType'] = value;
                        });
                      },
                      fontSize: 14,
                      spacing:
                          _responsive.responsiveWidth(forUnInitialDevices: 2),
                      title: 'Floor Type',
                      containerHeight: 0.08,
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                    paddingValue: 0.1,
                    condition: () => _dataKey.contains('heating'),
                    trueCase: CustomExpandedTile(
                      radius: 7,
                      children: heating,
                      containerWidth: 0.16,
                      subTitle: _provider.state.data['heating'],
                      onTap: (value) {
                        setState(() {
                          _provider.state.data['heating'] = value;
                        });
                      },
                      fontSize: 13,
                      spacing:
                          _responsive.responsiveWidth(forUnInitialDevices: 2),
                      title: 'heating',
                      containerHeight: 0.05,
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                    paddingValue: 0.1,
                    condition: () => _dataKey.contains('tabu'),
                    trueCase: CustomExpandedTile(
                      radius: 7,
                      children: tabuMode,
                      containerWidth: 0.16,
                      subTitle: _provider.state.data['tabu'],
                      onTap: (value) {
                        setState(() {
                          _provider.state.data['tabu'] = value;
                        });
                      },
                      fontSize: 13,
                      spacing:
                          _responsive.responsiveWidth(forUnInitialDevices: 2),
                      title: 'Tabu',
                      containerHeight: 0.05,
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                    paddingValue: 0.1,
                    condition: () => _dataKey.contains('from'),
                    trueCase: CustomExpandedTile(
                      radius: 7,
                      children: from,
                      containerWidth: 0.15,
                      fontSize: 15,
                      subTitle: _provider.state.data['from'],
                      onTap: (value) {
                        setState(() {
                          _provider.state.data['from'] = value;
                        });
                      },
                      spacing:
                          _responsive.responsiveWidth(forUnInitialDevices: 2),
                      title: 'From',
                      containerHeight: 0.05,
                    ),
                  ),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                      condition: () => _dataKey.contains('location'),
                      paddingValue: 0,
                      trueCase: CustomTextField(
                        hint: 'location',
                        padding: 0.1,
                        suffix: Image.asset('assets/icons/Exclusion 22.png'),
                        width: _responsive.responsiveWidth(
                            forUnInitialDevices: 80),
                        height: _responsive.responsiveHeight(
                            forUnInitialDevices: 7),
                      )),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                      condition: () => _dataKey.contains('title'),
                      paddingValue: 0,
                      trueCase: CustomTextField(
                        hint: 'Title',
                        padding: 0.1,
                        width: _responsive.responsiveWidth(
                            forUnInitialDevices: 80),
                        height: _responsive.responsiveHeight(
                            forUnInitialDevices: 7),
                      )),
                  _VerticalSpacer(_responsive),
                  ConditionalWidget(
                      condition: () => _dataKey.contains('description'),
                      paddingValue: 0,
                      trueCase: CustomTextField(
                        hint: 'Description',
                        padding: 0.1,
                        minLines: 3,
                        maxLines: 6,
                        width: _responsive.responsiveWidth(
                            forUnInitialDevices: 80),
                        height: _responsive.responsiveHeight(
                            forUnInitialDevices: 15),
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
