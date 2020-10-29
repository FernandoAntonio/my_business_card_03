import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:mi_card/constants.dart';

class MenuCard extends StatelessWidget {
  MenuCard({
    @required this.title,
    @required this.iconData,
    this.onPressed,
  });

  final String title;
  final IconData iconData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed != null ? onPressed : () {},
      child: GradientCard(
        gradient: LinearGradient(colors: [kGrey300, kGrey200, kWhite]),
        margin: EdgeInsets.symmetric(horizontal: 32.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        elevation: 5.0,
        child: ListTile(
          leading: Icon(iconData, color: Colors.teal[900]),
          title: Text(
            title,
            style: TextStyle(
                fontFamily: 'SourceSansPro', color: kTeal800, fontSize: 17.0),
          ),
        ),
      ),
    );
  }
}
