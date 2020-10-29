import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:mi_card/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import 'menu_card_widget.dart';

class MyBusinessCardScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              CircleAvatar(
                backgroundImage: AssetImage('images/me.jpg'),
                radius: 50.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'Fernando Antônio',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              GradientText(
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
              SizedBox(
                height: 16.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.4,
                child: Divider(color: kTeal200),
              ),
              SizedBox(height: 32.0),
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
      ),
    );
  }
}
