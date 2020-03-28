import 'package:flutter/material.dart';

class HomeActionButton extends StatelessWidget {

  final IconData icon;
  final Function onTap;

  const HomeActionButton({Key key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lightGreen,
          ),
          shape: BoxShape.circle),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon),
        iconSize: 60,
        color: Colors.green,
      ),
    );;
  }
}
