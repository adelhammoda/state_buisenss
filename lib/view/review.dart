import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/provider/real_state_provider.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/widget/backbuttonorange.dart';
import 'package:state_business/widget/carousel_slider.dart';
import 'package:state_business/widget/conditional_widget.dart';
import 'package:state_business/widget/custom_text_field.dart';
import 'package:state_business/widget/titlecontainer.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

void _onSubmitted(context) {
  Navigator.of(context).pushNamed('result');
}

class _ReviewState extends State<Review> {
  late Responsive _responsive;
  List<String> _pickedImagespath = [];
  final TextEditingController controller = TextEditingController();
  late RealStateProvider _provider;
  late List<String> _dataKey = _provider.state.data.keys.toList();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _responsive = Responsive(
      context,
      removePadding: true,
    );
    _provider = Provider.of<RealStateProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackbuttonOrange(
          onTap: () {},
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: _responsive.responsiveHeight(forUnInitialDevices: 20),
            child: CustomCarousel(
              deleteIconFunction: (index) {
                Provider.of<RealStateProvider>(context, listen: false)
                    .deleteImage(index);
              },
              onAddIconPressed: () {
                // Provider.of<RealStateProvider>(context,listen: false).addImage(index);
                // showModalBottomSheet(
                //   context: context,
                //   builder: ((builder) =>
                //       chooseImage(() {}, () async {
                //         await ImagePicker().pickMultiImage(imageQuality: 75).then((value) {
                //           postImages=value!;
                //           setState(()  {
                //             // postImages=value;
                //             imageUploadCompleted = true;
                //           });
                //         });
                //
                //       })),
                // );
              },
              responsive: _responsive,
              height: _responsive.responsiveHeight(forUnInitialDevices: 20),
              imagesUrl: _pickedImagespath,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        _responsive.responsiveWidth(forUnInitialDevices: 5),
                    vertical:
                        _responsive.responsiveHeight(forUnInitialDevices: 2)),
                child: Column(
                  children: [
                    ConditionalWidget(
                      paddingValue:
                          _responsive.responsiveWidth(forUnInitialDevices: 2.5),
                      condition: () => _dataKey.contains('title'),
                      trueCase: CustomTextField(
                        height: _responsive.responsiveHeight(
                            forUnInitialDevices: 6),
                        hint: 'Title',
                        suffix: Text(_provider.state.data['title'].toString()),
                        onChanged: (value) {
                          _provider.state.data['title'] = value;
                        },
                        width: _responsive.responsiveWidth(
                            forUnInitialDevices: 90),
                      ),
                    ),
                    _verticalSpacer(responsive: _responsive),
                    Wrap(
                      runSpacing: 20,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      children: [
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('price'),
                          trueCase: CustomTextField(
                            hint: 'Flyat',
                            suffix:
                                Text(_provider.state.data['price'].toString()),
                            enable: _provider.canEdit,
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
                          condition: () => _dataKey.contains('area m2'),
                          trueCase: CustomTextField(
                            suffix: Text(
                                _provider.state.data['area m2'].toString()),
                            hint: 'Area(m2)',
                            enable: _provider.canEdit,
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
                          condition: () => _dataKey.contains('area m2(net)'),
                          trueCase: CustomTextField(
                            hint: 'Area(m2)(net)',
                            enable: _provider.canEdit,
                            suffix: Text(_provider.state.data['area m2(net)']
                                .toString()),
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
                          condition: () => _dataKey.contains('date'),
                          trueCase: CustomTextField(
                            hint: 'Date',
                            enable: _provider.canEdit,
                            suffix: Text(_provider.state.data['date']),
                            onChanged: (value) {
                              _provider.state.data['date'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 40),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('tabu'),
                          trueCase: CustomTextField(
                            hint: 'Date',
                            enable: _provider.canEdit,
                            suffix: Text(_provider.state.data['tabu']),
                            onChanged: (value) {
                              _provider.state.data['tabu'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 40),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('heating'),
                          trueCase: CustomTextField(
                            hint: 'Heating',
                            enable: _provider.canEdit,
                            suffix: Text(_provider.state.data['heating']),
                            onChanged: (value) {
                              _provider.state.data['heating'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 40),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('state'),
                          trueCase: CustomTextField(
                            hint: 'State',
                            enable: _provider.canEdit,
                            suffix: Text(_provider.state.data['state']),
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
                          condition: () => _dataKey.contains('from'),
                          trueCase: CustomTextField(
                            hint: 'From',
                            enable: _provider.canEdit,
                            suffix: Text(_provider.state.data['from']),
                            onChanged: (value) {
                              _provider.state.data['from'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 40),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('Ads No'),
                          trueCase: CustomTextField(
                            hint: 'Ads No',
                            enable: _provider.canEdit,
                            suffix:
                                Text(_provider.state.data['Ads No'].toString()),
                            onChanged: (value) {
                              _provider.state.data['Ads No'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 40),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('location'),
                          trueCase: CustomTextField(
                            hint: 'location',
                            enable: false,
                            padding: 0.1,
                            suffix:
                                Image.asset('assets/icons/Exclusion 22.png'),
                            onChanged: (value) {
                              _provider.state.data['location'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 40),
                          ),
                        ),
                      ],
                    ),
                    _verticalSpacer(responsive: _responsive),
                    Wrap(
                      runSpacing: 20,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      children: [
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('NumberOfFloor'),
                          trueCase: CustomTextField(
                            padding: 0.05,
                            hint: 'Floor#',
                            suffix: Text(_provider.state.data['NumberOfFloor']
                                .toString()),
                            enable: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['NumberOfFloor'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 20),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('Banyo Number'),
                          trueCase: CustomTextField(
                            padding: 0.05,
                            hint: 'Bath#',
                            suffix: Text(_provider.state.data['Banyo Number']
                                .toString()),
                            enable: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['Banyo Number'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 20),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('age'),
                          trueCase: CustomTextField(
                            padding: 0.05,
                            hint: 'Age#',
                            suffix:
                                Text(_provider.state.data['age'].toString()),
                            enable: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['age'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 20),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('NumberOfFloor'),
                          trueCase: CustomTextField(
                            padding: 0.05,
                            hint: 'Floors#',
                            suffix: Text(_provider.state.data['NumberOfFloor']
                                .toString()),
                            enable: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['NumberOfFloor'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 20),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('aidat'),
                          trueCase: CustomTextField(
                            padding: 0.05,
                            hint: 'Aidat#',
                            suffix:
                                Text(_provider.state.data['aidat'].toString()),
                            enable: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['aidat'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 20),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('balkon'),
                          trueCase: CustomTextField(
                            padding: 0.05,
                            hint: 'Balkon#',
                            suffix:
                                Text(_provider.state.data['balkon'].toString()),
                            enable: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['balkon'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 20),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('numberOfRooms'),
                          trueCase: CustomTextField(
                            padding: 0.05,
                            hint: 'Room#',
                            suffix: Text(_provider.state.data['numberOfRooms']
                                .toString()),
                            enable: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['numberOfRooms'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 20),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('furnished'),
                          trueCase: CustomTextField(
                            padding: 0.05,
                            hint: 'Furnished#',
                            suffix: Text(
                                _provider.state.data['furnished'].toString()),
                            enable: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['furnished'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 20),
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('swap'),
                          trueCase: CustomTextField(
                            padding: 0.05,
                            hint: 'Swap#',
                            suffix:
                                Text(_provider.state.data['swap'].toString()),
                            enable: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['swap'] = value;
                            },
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 20),
                          ),
                        ),
                      ],
                    ),
                    _verticalSpacer(responsive: _responsive),
                    ConditionalWidget(
                      paddingValue:
                          _responsive.responsiveWidth(forUnInitialDevices: 2.5),
                      condition: () => _dataKey.contains('description'),
                      trueCase: CustomTextField(
                        height: _responsive.responsiveHeight(
                            forUnInitialDevices: 6),
                        hint: 'Description',
                        suffix: Text(
                            _provider.state.data['description'].toString()),
                        onChanged: (value) {
                          _provider.state.data['description'] = value;
                        },
                        width: _responsive.responsiveWidth(
                            forUnInitialDevices: 90),
                      ),
                    ),
                    _verticalSpacer(responsive: _responsive),
                    InkWell(
                      onTap: (){
                        _onSubmitted(context);
                      },
                      child: TitleContainer(
                          height: 0.06,
                          width: 0.3,
                          text: 'Submit',
                          color: iconColor,
                          textColor: Colors.white),
                    ),
                  ],
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class _verticalSpacer extends StatelessWidget {
  Responsive responsive;

  _verticalSpacer({Key? key, required this.responsive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsive.responsiveHeight(forUnInitialDevices: 2),
    );
  }
}
