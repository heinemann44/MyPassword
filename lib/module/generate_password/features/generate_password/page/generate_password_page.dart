import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_password/module/generate_password/features/generate_password/controller/generate_password_form_controller.dart';
import 'package:my_password/module/generate_password/features/generate_password/data/repository/repository_service_password.dart';
import 'package:my_password/module/generate_password/features/generate_password/page/generate_password_form.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/data/item_password.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GeneratePasswordPage extends StatefulWidget {
  @override
  _GeneratePasswordPageState createState() => _GeneratePasswordPageState();
}

class _GeneratePasswordPageState extends State<GeneratePasswordPage> {
  TextStyle _kPasswordStyle = TextStyle(fontSize: 20);
  final GeneratePasswordFormController _pageController = GeneratePasswordFormController();

  @override
  void initState() {
    super.initState();
    this._pageController.hasLetters = true;
    this._pageController.hasSpecialCharacters = true;
    this._pageController.hasNumbers = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate Password"),
      ),
      body: this._buildContentBody(),
      bottomNavigationBar: this._buildSaveButton(),
    );
  }

  Widget _buildContentBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GeneratePasswordForm(pageController: this._pageController),
            SizedBox(height: 60),
            this._buildTextPasswordGenerated(),
            SizedBox(height: 16),
            this._buildGeneratePasswordButton(),
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
      child: Observer(
        builder: (_) => Text(
          this._pageController.passwordGenerate ?? "",
          textAlign: TextAlign.center,
          style: this._kPasswordStyle,
        ),
      ),
    );
  }

  Widget _buildGeneratePasswordButton(){
    return FlatButton(
      child: Text("Generate password"),
      onPressed: this._pageController.handleOnTapGeneratePassword,
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      height: 60,
      child: FlatButton(
        child: Text(
          "Save",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        color: Colors.green,
        onPressed: this._handleOnTapSaveButton,
      ),
    );
  }

  void _handleOnTapSaveButton() async {
    int id;
    ItemPassword password;

    id = await RepositoryServicePassword.count();

    password = ItemPassword(
      id: id+1,
      applicationName: "application name test",
      password: "passwotd test",
      isDeleted: false,
      showPassword: false,
    );

    RepositoryServicePassword.add(password);
  }

}
