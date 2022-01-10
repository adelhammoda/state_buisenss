import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:state_business/provider/real_state_provider.dart';
import 'package:state_business/utils/flat_options.dart';
import 'package:state_business/utils/theme.dart';
import 'package:state_business/widget/custom_app_bar.dart';
import 'package:state_business/widget/custom_drop_down_menu.dart';
import 'package:state_business/widget/custom_expanded_tile.dart';
import 'package:state_business/widget/custom_text_field.dart';
import 'package:state_business/widget/titlecontainer.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  late Responsive _responsive;
  late final RealStateProvider _provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _responsive = Responsive(context);
    _provider = Provider.of<RealStateProvider>(context);
  }

  void _onSubmitted(){
    Navigator.of(context).pushNamed('result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleContainerHeight:
            _responsive.responsiveWidth(forUnInitialDevices: 10),
        titleContainerWidth:
            _responsive.responsiveWidth(forUnInitialDevices: 20),
        barTitle: 'Filter',
        responsive: _responsive,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: _responsive.responsiveWidth(forUnInitialDevices: 5),
              right: _responsive.responsiveWidth(forUnInitialDevices: 5),
              top: _responsive.responsiveWidth(forUnInitialDevices: 5)),
          child: Column(
            children: [
              SpacerWithTitle(title: 'Country', responsive: _responsive),
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing:
                    _responsive.responsiveHeight(forUnInitialDevices: 2),
                spacing: _responsive.responsiveWidth(forUnInitialDevices: 5),
                children: [
                  CustomDropDownMenu(
                      hint: const Text('Country'),
                      width:
                          _responsive.responsiveWidth(forUnInitialDevices: 40),
                      items: country,
                      onChanged: (val) {}),
                  CustomDropDownMenu(
                      hint: const Text('State'),
                      width:
                          _responsive.responsiveWidth(forUnInitialDevices: 40),
                      items: status,
                      onChanged: (val) {}),
                  CustomDropDownMenu(
                      hint: const Text('City'),
                      items: city,
                      width:
                          _responsive.responsiveWidth(forUnInitialDevices: 40),
                      onChanged: (val) {}),
                  CustomDropDownMenu(
                      width:
                          _responsive.responsiveWidth(forUnInitialDevices: 40),
                      hint: Row(
                        children: [
                          Image.asset('assets/icons/Subtraction 368.png'),
                          const Text('Country'),
                        ],
                      ),
                      items: country,
                      onChanged: (val) {}),
                ],
              ),
              SpacerWithTitle(title: 'Price', responsive: _responsive),
              Row(
                children: [
                  CustomTextField(
                    hint: '',

                    width: _responsive.responsiveWidth(forUnInitialDevices: 20),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('TO'),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomTextField(
                    hint: '',
                    width: _responsive.responsiveWidth(forUnInitialDevices: 20),
                  ),
                  const Spacer(),
                  InkWell(
                    child: TitleContainer(
                      color: iconColor,
                      width: 0.07,
                      fontSize: _responsive.responsiveValue(forUnInitialDevices: 4),
                      textColor: Colors.black,
                      allBorderRadius: 6,
                      height: 0.04,
                      text: '\$',
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      child: TitleContainer(
                    color: iconColor,
                    width: 0.07,
                        textColor: Colors.black,
                        fontSize: _responsive.responsiveValue(forUnInitialDevices: 3),
                    allBorderRadius: 6,
                    height: 0.04,
                    text: 'EUR',
                  )),
                ],
              ),
              SpacerWithTitle(title: 'Area', responsive: _responsive),
              Row(
                children: [
                  CustomTextField(
                    hint: '',
                    width: _responsive.responsiveWidth(forUnInitialDevices: 20),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('TO'),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomTextField(
                    hint: '',
                    width: _responsive.responsiveWidth(forUnInitialDevices: 20),
                  ),

                ],
              ),
              SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 2),),
              CustomExpandedTile(
                radius: 7,
                children: numberOfRoom,
                containerWidth: 0.1,
                subTitle: _provider.state.data['numberOfRooms'],
                onTap: (value) {
                  setState(() {
                    _provider.state.data['numberOfRooms'] = value;
                  });
                },
                spacing: _responsive.responsiveWidth(forUnInitialDevices: 2),
                title: 'Number of Room',
                containerHeight: 0.05,
              ),
              SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 2),),
              CustomExpandedTile(
                radius: 7,
                children: age,
                containerWidth: 0.15,
                subTitle: _provider.state.data['age'],
                onTap: (value) {
                  setState(() {
                    _provider.state.data['age'] = value;
                  });
                },
                spacing: _responsive.responsiveWidth(forUnInitialDevices: 2),
                title: 'Age',
                containerHeight: 0.05,
              ),
              SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 2),),
              CustomExpandedTile(
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
                spacing: _responsive.responsiveWidth(forUnInitialDevices: 2),
                title: 'Floor Type',
                containerHeight: 0.08,
              ),
              SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 2),),
              CustomExpandedTile(
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
                spacing: _responsive.responsiveWidth(forUnInitialDevices: 2),
                title: 'Tabu',
                containerHeight: 0.05,
              ),
              SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 2),),

              CustomExpandedTile(
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
                spacing: _responsive.responsiveWidth(forUnInitialDevices: 2),
                title: 'From',
                containerHeight: 0.05,
              ),
              SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 2),),
              CustomExpandedTile(
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
                spacing: _responsive.responsiveWidth(forUnInitialDevices: 2),
                title: 'heating',
                containerHeight: 0.05,
              ),
              SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 2),),
              InkWell(
                onTap: _onSubmitted,
                child: TitleContainer(
                    height: 0.06,
                    width: 0.3,
                    text: 'Next',
                    color: iconColor,
                    textColor: Colors.white),
              ),
              SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 2),),
            ],
          ),
        ),
      ),
    );
  }
}

class SpacerWithTitle extends StatelessWidget {
  final String title;
  final Responsive responsive;

  const SpacerWithTitle({
    Key? key,
    required this.title,
    required this.responsive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
