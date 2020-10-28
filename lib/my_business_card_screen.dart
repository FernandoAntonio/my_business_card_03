import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'menu_card_widget.dart';

class MyBusinessCardScreen extends StatelessWidget {
  _launchTelephoneNumber(String number) async {
    final String telephoneNumber = Uri(scheme: 'tel', path: number).toString();
    await launch(telephoneNumber);
  }

  _launchEmail(String email) async {
    final String mailTo = Uri(scheme: 'mailto', path: email).toString();
    await launch(mailTo);
  }

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
                  colors: [
                    Colors.teal[300],
                    Colors.teal[200],
                    Colors.teal[100]
                  ],
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
                onPressed: () => _launchTelephoneNumber('+5562999323252'),
              ),
              MenuCard(
                title: 'fernandojr.semrhfj@hotmail.com',
                iconData: Icons.email,
                onPressed: () => _launchEmail('fernandojr.semrhfj@hotmail.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
