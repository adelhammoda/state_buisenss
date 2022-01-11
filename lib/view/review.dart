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
                        suffixIcon: const SizedBox(),


                        hintTextSize: 13,

                        fillcolor: textFieldColor,
                        enabled: _provider.canEdit,
                        errorMsg  :'',
                        formkey: GlobalKey(),
                        width:0.9,
                        // readOnly: true,
                        // height: 0.03,
                        hintText: 'Title',
                        initialValue:'Title:'+ _provider.state.data['title'].toString(),
                        onChanged: (value) {
                          _provider.state.data['title'] = value;
                        },
                      ),
                    ),
                    _verticalSpacer(responsive: _responsive),
                    Wrap(
                      runSpacing: 20,
                      spacing: _responsive.responsiveWidth(forUnInitialDevices:0),
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      children: [
                        ConditionalWidget(
                          paddingValue: _responsive.responsiveWidth(
                              forUnInitialDevices: 2.5),
                          condition: () => _dataKey.contains('price'),
                          trueCase: TextFieldContainer(
                            suffixIcon: const SizedBox(),


                            hintTextSize: 13,

                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Flyat',
                            initialValue:'Flyat:'+ _provider.state.data['price'].toString(),
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
                            suffixIcon: const SizedBox(),


                            hintTextSize: 13,

                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            initialValue:
                            'Area(m2)'  + _provider.state.data['area m2'].toString(),
                            hintText: 'Area(m2)',
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
                            suffixIcon: const SizedBox(),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Area(m2)(net)',
                            initialValue:'Area(m2)(net)'+ _provider.state.data['area m2(net)']
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
                            suffixIcon: const SizedBox(),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Date',
                            initialValue:'Date'+ _provider.state.data['date'],
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
                            suffixIcon: const SizedBox(),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Tabu',
                            initialValue:'Tabu:'+ _provider.state.data['tabu'],
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
                            suffixIcon: const SizedBox(),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Heating',
                            initialValue:'Heating'+ _provider.state.data['heating'],
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
                            suffixIcon: const SizedBox(),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'State',
                            initialValue:'State'+ _provider.state.data['state'],
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
                            suffixIcon: const SizedBox(),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'From',
                            initialValue: 'From'+ _provider.state.data['from'],
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
                            suffixIcon: const SizedBox(),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.4,
                            hintText: 'Ads No',
                            initialValue:
                            'Ads No'+  _provider.state.data['Ads No'].toString(),
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
                            suffixIcon: const SizedBox(),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.9,
                            hintText: 'location',
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
                            suffixIcon:  Center(
                              child: Text('Floor: '+ _provider.state.data['NumberOfFloor'].toString()),
                            ),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.2,
                            hintText: 'Floor#',
                            initialValue:'Floor#'+ _provider.state.data['NumberOfFloor']
                                .toString(),
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
                            suffixIcon:  Center(
                              child: Text('Bath: '+ _provider.state.data['Banyo Number'].toString()),
                            ),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.2,
                            hintText: 'Bath#',
                            initialValue:'Bath#'+ _provider.state.data['Banyo Number']
                                .toString(),
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
                            suffixIcon:  Center(
                              child: Text('Age: '+ _provider.state.data['age'].toString()),
                            ),

                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.2,
                            hintText: 'Age#',
                            initialValue:
                            'Age#'+_provider.state.data['age'].toString(),
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
                            suffixIcon:  Center(
                              child: Text('Floors: '+ _provider.state.data['NumberOfFloor'].toString()),
                            ),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.2,

                            hintText: 'Floors#',
                            initialValue:'Floors#'+_provider.state.data['NumberOfFloor']
                                .toString(),
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
                            suffixIcon:  Center(
                              child: Text('Aidat: \n'+ _provider.state.data['aidat'].toString()),
                            ),

                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.2,

                            hintText: 'Aidat#',
                            initialValue:'Aidat#'+
                                _provider.state.data['aidat'].toString(),
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
                            suffixIcon:  Center(
                              child: Text('Balkon: \n'+ _provider.state.data['balkon'].toString()),
                            ),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.2,
                            hintText: 'Balkon#',
                            initialValue:'Balkon#'+
                                _provider.state.data['balkon'].toString(),
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
                            suffixIcon:  Center(
                              child: Text('Room: \n'+ _provider.state.data['numberOfRooms'].toString()),
                            ),


                            hintTextSize: 13,


                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.2,
                            hintText: 'Room#',
                            initialValue:'Room#'+ _provider.state.data['numberOfRooms']
                                .toString(),
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
                            suffixIcon:  Center(
                              child: Text('Furnished: \n'+ _provider.state.data['furnished'].toString()),
                            ),
                            hintTextSize: 9,
                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.2,
                            hintText: 'Furnished#',
                            initialValue:'Furnished# '+
                                _provider.state.data['furnished'].toString(),
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
                            hintTextSize: 10,
                            fillcolor: textFieldColor,
                            enabled: _provider.canEdit,
                            errorMsg  :'',
                            formkey: GlobalKey(),
                            width:0.2,
                            hintText: 'Swap#',
                            initialValue:'Swap#'+
                              _provider.state.data['swap'].toString(),
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
                        suffixIcon: const SizedBox(),


                        hintTextSize: 13,

                            fillcolor: textFieldColor,
                        enabled: _provider.canEdit,
                        errorMsg  :'',
                        formkey: GlobalKey(),
                        width:0.9,
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
