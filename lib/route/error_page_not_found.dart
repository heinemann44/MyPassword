import 'package:flutter/material.dart';

class ErrorPageNotFound extends StatefulWidget {
  @override
  _ErrorPageNotFoundState createState() => _ErrorPageNotFoundState();
}

class _ErrorPageNotFoundState extends State<ErrorPageNotFound> {
  TextStyle _kStyleNotFound = TextStyle(
    fontSize: 40,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Page not found =(",
              style: this._kStyleNotFound,
            ),
            SizedBox(height: 16),
            Icon(
              Icons.block,
              size: 100,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
