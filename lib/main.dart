import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_business/provider/real_state_provider.dart';
import 'package:state_business/view/add_real_state.dart';
import 'package:state_business/view/filter.dart';
import 'package:state_business/view/real_state.dart';
import 'package:state_business/view/result.dart';
import 'package:state_business/view/review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
    create: (_) => RealStateProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'business',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (_) =>  const AddRealState(),
        'FlatPage': (_) => const FlatPage(),
        'review': (_) => ChangeNotifierProvider(
              create: (_) => RealStateProvider(),
              child: const Review(),
            ),
        'result': (_) => const Result(),
        'filter': (_) => const Filter()
      },
    ));
  }
}
