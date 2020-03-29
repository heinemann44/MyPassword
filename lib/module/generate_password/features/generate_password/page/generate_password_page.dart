import 'package:flutter/material.dart';
import 'package:my_password/module/generate_password/features/generate_password/page/generate_password_form.dart';

class GeneratePasswordPage extends StatefulWidget {
  @override
  _GeneratePasswordPageState createState() => _GeneratePasswordPageState();
}

class _GeneratePasswordPageState extends State<GeneratePasswordPage> {
  TextStyle _kPasswordStyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate Password"),
      ),
      body: this._buildContentBody(),
    );
  }

  Widget _buildContentBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GeneratePasswordForm(),
            SizedBox(height: 60),
            this._buildTextPasswordGenerated(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextPasswordGenerated() {
    return Container(
      padding: EdgeInsets.only(
        bottom: 5,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
      child: Text(
        "123121231233213213231e",
        textAlign: TextAlign.center,
        style: this._kPasswordStyle,
      ),
    );
  }
}
