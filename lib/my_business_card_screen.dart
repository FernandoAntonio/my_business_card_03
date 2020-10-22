import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'reusable_card_widget.dart';

class MyBusinessCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal[800], Colors.teal[700], Colors.teal[600]],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/me.jpg'),
                radius: 50.0,
              ),
              Text(
                'Fernando Antônio',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GradientText(
                'FLUTTER DEVELOPER',
                gradient: LinearGradient(
                  colors: [Colors.teal[300], Colors.teal[200], Colors.teal[100]],
                ),
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                  height: 15.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal[200],
                  )),
              MenuCard(
                title: '+55 62 99932-3252',
                iconData: Icons.phone,
              ),
              MenuCard(
                title: 'fernandojr.semrhfj@hotmail.com',
                iconData: Icons.email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}