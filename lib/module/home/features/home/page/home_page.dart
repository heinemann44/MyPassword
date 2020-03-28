import 'package:flutter/material.dart';
import 'package:my_password/module/home/features/home/page/home_action_button.dart';

class HomePage extends StatelessWidget {
  static const TextStyle _kTitleAppStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._buildContentBody(),
    );
  }

  Widget _buildContentBody() {
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            this._buildAppMessage(),
            this._buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppMessage() {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: 150,
      child: Center(
        child: Text(
          "Welcome to My password!",
          style: _kTitleAppStyle,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        this._buildListPasswordButton(),
        this._buildGeneratePasswordButton(),
      ],
    );
  }

  Widget _buildListPasswordButton() {
    return HomeActionButton(
      icon: Icons.list,
      onTap: () => print("list"),
    );
  }

  Widget _buildGeneratePasswordButton() {
    return HomeActionButton(
      icon: Icons.vpn_key,
      onTap: () => print("key"),
    );
  }
}
