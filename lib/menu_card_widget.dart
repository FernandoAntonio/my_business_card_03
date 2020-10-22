import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

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
        gradient:
            LinearGradient(colors: [Colors.grey[300], Colors.grey[200], Colors.white]),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        elevation: 5.0,
        child: ListTile(
          leading: Icon(iconData, color: Colors.teal[900]),
          title: Text(
            title,
            style: TextStyle(
                fontFamily: 'SourceSansPro', color: Colors.teal[900], fontSize: 17.0),
          ),
        ),
      ),
    );
  }
}
