import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_password/module/generate_password/features/generate_password/controller/generate_password_form_controller.dart';

class GeneratePasswordForm extends StatefulWidget {
  @override
  _GeneratePasswordFormState createState() => _GeneratePasswordFormState();
}

class _GeneratePasswordFormState extends State<GeneratePasswordForm> {
  final GeneratePasswordFormController _controller =
      GeneratePasswordFormController();

  TextStyle _kSwitchTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  @override
  void initState() {
    this._controller.hasLetters = true;
    this._controller.hasNumbers = true;
    this._controller.hasSpecialCharacters = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        this._buildFieldApplicationName(),
        this._buildFieldHasLetters(),
        this._buildFieldHasNumbers(),
        this._buildFieldHasSpecialCharacters(),
      ],
    );
  }

  Widget _buildFieldApplicationName() {
    return TextField(
      decoration: InputDecoration(labelText: "Application name"),
    );
  }

  Widget _buildFieldHasLetters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Letters?",
          style: this._kSwitchTextStyle,
        ),
        Observer(
          builder: (_) => Switch(
            value: this._controller.hasLetters,
            onChanged: (value) => this._controller.onTapHasLetters(),
          ),
        ),
      ],
    );
  }

  Widget _buildFieldHasNumbers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Numbers?",
          style: this._kSwitchTextStyle,
        ),
        Observer(
          builder: (_) => Switch(
            value: this._controller.hasNumbers,
            onChanged: (value) => this._controller.onTapHasNumbers(),
          ),
        ),
      ],
    );
  }

  Widget _buildFieldHasSpecialCharacters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Special characters?",
          style: this._kSwitchTextStyle,
        ),
        Observer(
          builder: (_) => Switch(
            value: this._controller.hasSpecialCharacters,
            onChanged: (value) => this._controller.onTapHasSpacialCharacter(),
          ),
        ),
      ],
    );
  }
}
