import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/provider/real_state_provider.dart';
import 'package:state_business/server/state_buisness_server.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/widget/backbuttonorange.dart';
import 'package:state_business/widget/carousel_slider.dart';
import 'package:state_business/widget/conditional_widget.dart';
import 'package:state_business/widget/textfield_container.dart';
import 'package:state_business/widget/titlecontainer.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
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
  void _onSubmitted() {
    StateBusinessServer server = StateBusinessServer(
        route:
        '${_provider.selectedState}/${_provider.openBusiness}/${_provider.selectedContracting}/${_provider.state.data['country']}/${_provider.state.data['city']}');
    server.pushData( _provider.state.data);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) =>
          ChangeNotifierProvider.value(
            value: Provider.of<RealStateProvider>(context),
            child:const Review(),
          ),
    ));
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
                      trueCase: TextFieldContainer(
                        errorMsg  :'',
                        formkey: GlobalKey(),
                        width:0.4,
                        height: _responsive.responsiveHeight(
                            forUnInitialDevices: 6),
                        hintText: 'Title',
                        initialValue: _provider.state.data['title'].toString(),
                        onChanged: (value) {
                          _provider.state.data['title'] = value;
                        },
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
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Flyat',
                            initialValue: _provider.state.data['price'].toString(),
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['price'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('area m2'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            initialValue:
                                _provider.state.data['area m2'].toString(),
                            hintText: 'Area(m2)',
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['area m2'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('area m2(net)'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Area(m2)(net)',
                            enabled: _provider.canEdit,
                            initialValue: _provider.state.data['area m2(net)']
                                .toString(),
                            onChanged: (value) {
                              _provider.state.data['area m2(net)'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('date'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Date',
                            enabled: _provider.canEdit,
                            initialValue: _provider.state.data['date'],
                            onChanged: (value) {
                              _provider.state.data['date'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('tabu'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Date',
                            enabled: _provider.canEdit,
                            initialValue: _provider.state.data['tabu'],
                            onChanged: (value) {
                              _provider.state.data['tabu'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('heating'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Heating',
                            enabled: _provider.canEdit,
                            initialValue: _provider.state.data['heating'],
                            onChanged: (value) {
                              _provider.state.data['heating'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('state'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'State',
                            enabled: _provider.canEdit,
                            initialValue: _provider.state.data['state'],
                            onChanged: (value) {
                              _provider.state.data['state'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('from'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'From',
                            enabled: _provider.canEdit,
                            initialValue: _provider.state.data['from'],
                            onChanged: (value) {
                              _provider.state.data['from'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('Ads No'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Ads No',
                            enabled: _provider.canEdit,
                            initialValue:
                                _provider.state.data['Ads No'].toString(),
                            onChanged: (value) {
                              _provider.state.data['Ads No'] = value;
                            },

                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('location'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'location',
                            enabled: false,
                            presuffixIcon:
                                Image.asset('assets/icons/Exclusion 22.png'),
                            onChanged: (value) {
                              _provider.state.data['location'] = value;
                            },
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
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Floor#',
                            initialValue: _provider.state.data['NumberOfFloor']
                                .toString(),
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['NumberOfFloor'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('Banyo Number'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Bath#',
                            initialValue: _provider.state.data['Banyo Number']
                                .toString(),
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['Banyo Number'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('age'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Age#',
                            initialValue:
                                _provider.state.data['age'].toString(),
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['age'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('NumberOfFloor'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,

                            hintText: 'Floors#',
                            initialValue:_provider.state.data['NumberOfFloor']
                                .toString(),
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['NumberOfFloor'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('aidat'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,

                            hintText: 'Aidat#',
                            initialValue:
                                _provider.state.data['aidat'].toString(),
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['aidat'] = value;
                            },

                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('balkon'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Balkon#',
                            initialValue:
                                _provider.state.data['balkon'].toString(),
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['balkon'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('numberOfRooms'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Room#',
                            initialValue: _provider.state.data['numberOfRooms']
                                .toString(),
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['numberOfRooms'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('furnished'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',

                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Furnished#',
                            initialValue:
                                _provider.state.data['furnished'].toString(),
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['furnished'] = value;
                            },
                          ),
                        ),
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          condition: () => _dataKey.contains('swap'),
                          trueCase: TextFieldContainer(
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Swap#',
                            initialValue:
                              _provider.state.data['swap'].toString(),
                            enabled: _provider.canEdit,
                            onChanged: (value) {
                              _provider.state.data['swap'] = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    _verticalSpacer(responsive: _responsive),
                    ConditionalWidget(
                      paddingValue:
                          _responsive.responsiveWidth(forUnInitialDevices: 2.5),
                      condition: () => _dataKey.contains('description'),
                      trueCase: TextFieldContainer(
                        errorMsg  :'',
                        formkey: GlobalKey(),
                        width:0.4,
                        height: _responsive.responsiveHeight(
                            forUnInitialDevices: 6),
                        hintText: 'Description',
                        initialValue:
                            _provider.state.data['description'].toString(),
                        onChanged: (value) {
                          _provider.state.data['description'] = value;
                        },
                      ),
                    ),
                    _verticalSpacer(responsive: _responsive),
                    InkWell(
                      onTap: _onSubmitted,
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
