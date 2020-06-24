import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_password/module/generate_password/features/generate_password/controller/generate_password_form_controller.dart';

class GeneratePasswordForm extends StatelessWidget {
  final GeneratePasswordFormController pageController;

  const GeneratePasswordForm({Key key, this.pageController}) : super(key: key);

  TextStyle get _kSwitchTextStyle => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      );

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
            value: this.pageController.hasLetters,
            onChanged: (value) => this.pageController.onTapHasLetters(),
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
            value: this.pageController.hasNumbers,
            onChanged: (value) => this.pageController.onTapHasNumbers(),
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
            value: this.pageController.hasSpecialCharacters,
            onChanged: (value) =>
                this.pageController.onTapHasSpacialCharacter(),
          ),
        ),
      ],
    );
  }
}
