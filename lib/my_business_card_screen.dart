import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:mi_card/constants.dart';
import 'package:sensors/sensors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import 'menu_card_widget.dart';

class MyBusinessCardScreen extends StatefulWidget {
  @override
  _MyBusinessCardScreenState createState() => _MyBusinessCardScreenState();
}

class _MyBusinessCardScreenState extends State<MyBusinessCardScreen> {
  List<double> _accelerometerValues;

  double x1 = 0.0;
  double y1 = 0.0;
  double xIc3 = -10.0;

  _launchWhatsapp(String number) async {
    final String wpp = WhatsAppUnilink(
            phoneNumber: number, text: 'Olá, vi seu perfil no LinkedIn/GitHub')
        .toString();
    await launch(wpp);
  }

  _launchEmail(String email) async {
    final String mailTo = Uri(scheme: 'mailto', path: email).toString();
    await launch(mailTo);
  }

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      _accelerometerValues = <double>[event.x, event.y, event.z];
      print('x: ${event.x} y: ${event.y} z: ${event.z}');
      if ((_accelerometerValues[0] < 0)) {
        setState(() {
          x1 = x1 < 5.0 ? (x1 + 5.0) : 5.0;
        });
      } else {
        setState(() {
          x1 = x1 > -5.0 ? (x1 - 5.0) : -5.0;
        });
      }
      if ((_accelerometerValues[1] < 0)) {
        setState(() {
          y1 = y1 > -3.0 ? (y1 - 3.0) : -3.0;
        });
      } else {
        setState(() {
          y1 = y1 < 3.0 ? (y1 + 2.0) : 3.0;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kTeal800, kTeal700, kTeal600],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220.0,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    left: (MediaQuery.of(context).size.width / 2 - 50.0) + x1,
                    top: 15.0 + y1,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(500.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(1, 1),
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/me.jpg'),
                        radius: 50.0,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    top: 115.0 + y1,
                    left: (MediaQuery.of(context).size.width / 2 - 105.0) + x1,
                    duration: Duration(milliseconds: 200),
                    child: Text(
                      'Fernando Antônio',
                      style: TextStyle(
                        fontFamily: 'KaushanScript',
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black38,
                            offset: Offset(1, 1),
                            blurRadius: 9.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    top: 160.0 + y1,
                    left: (MediaQuery.of(context).size.width / 2 - 105.0) + x1,
                    duration: Duration(milliseconds: 200),
                    child: GradientText(
                      'FLUTTER DEVELOPER',
                      gradient: LinearGradient(
                        colors: [kTeal300, kTeal200, kTeal100],
                      ),
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    top: 180.0 + y1,
                    left: (MediaQuery.of(context).size.width / 2 - 60.0) + x1,
                    duration: Duration(milliseconds: 200),
                    child: SizedBox(
                      height: 16.0,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Divider(color: kTeal200),
                    ),
                  ),
                ],
              ),
            ),
            MenuCard(
              title: kMobileNumber,
              iconData: Icons.phone,
              onPressed: () => _launchWhatsapp(kMobileNumber),
            ),
            SizedBox(height: 16.0),
            MenuCard(
              title: kEmail,
              iconData: Icons.email,
              onPressed: () => _launchEmail(kEmail),
            ),
          ],
        ),
      ),
    );
  }
}
