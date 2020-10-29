import 'package:flutter/material.dart';

import 'constants.dart';
import 'my_business_card_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: kTeal600),
      home: MyBusinessCardScreen(),
    );
  }
}
