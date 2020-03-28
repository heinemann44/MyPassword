import 'package:flutter/material.dart';
import 'package:my_password/module/home/features/home/page/home_action_button.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/page/my_passwords_list_page.dart';

class HomePage extends StatefulWidget {
  static const TextStyle _kTitleAppStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      height: 150,
      child: Center(
        child: Text(
          "Welcome to My password!",
          style: HomePage._kTitleAppStyle,
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
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MyPasswordListPage(),
        ),
      ),
    );
  }

  Widget _buildGeneratePasswordButton() {
    return HomeActionButton(
      icon: Icons.vpn_key,
      onTap: () => print("key"),
    );
  }
}
