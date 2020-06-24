import 'dart:math';

import 'package:mobx/mobx.dart';

part 'generate_password_form_controller.g.dart';

class GeneratePasswordFormController = _GeneratePasswordFormControllerBase
    with _$GeneratePasswordFormController;

abstract class _GeneratePasswordFormControllerBase with Store {
  @observable
  bool hasLetters;
  @observable
  bool hasNumbers;
  @observable
  bool hasSpecialCharacters;
  @observable
  String passwordGenerate;

  int lengthPassword = 10;

  @action
  void onTapHasLetters() {
    this.hasLetters = !this.hasLetters;
  }

  @action
  void onTapHasNumbers() {
    this.hasNumbers = !this.hasNumbers;
  }

  @action
  void onTapHasSpacialCharacter() {
    this.hasSpecialCharacters = !this.hasSpecialCharacters;
  }

  @action
  void handleOnTapGeneratePassword() {
    String randomNumber = "";
    String randomLetter = "";
    String randomSpecialCharacters = "";
    List<int> lengthEachCondition = this._calculateLengthEachCondition();
    int index = 0;

    if (this.hasNumbers)
      randomNumber = this._generateRandomNumber(lengthEachCondition[index++]);
    if (this.hasLetters)
      randomLetter = this._generateRandomLetter(lengthEachCondition[index++]);
    if (this.hasSpecialCharacters)
      randomSpecialCharacters =
          this._generateRandomSpecialCharacters(lengthEachCondition[index++]);

    this.passwordGenerate =
        "$randomNumber$randomLetter$randomSpecialCharacters";
  }

  List<int> _calculateLengthEachCondition() {
    List<int> lengthEachCondition = List();
    int quantityConditionActive = this._countConditionActive();
    int lengthCondition = this.lengthPassword ~/ quantityConditionActive;
    int mod = this.lengthPassword % quantityConditionActive;

    for (int i = 0; i < quantityConditionActive; i++) {
      lengthEachCondition.add(lengthCondition);
    }

    lengthEachCondition..first = lengthCondition + mod;

    return lengthEachCondition;
  }

  int _countConditionActive() {
    int count = 0;

    if (this.hasNumbers) count++;
    if (this.hasLetters) count++;
    if (this.hasSpecialCharacters) count++;

    return count;
  }

  String _generateRandomNumber(int quantity) {
    String numberGenerate = "";
    Random random = Random();

    for (int i = 0; i < quantity; i++) {
      numberGenerate += random.nextInt(9).toString();
    }

    return numberGenerate;
  }

  String _generateRandomLetter(int quantity) {
    String chars = "abcdefghijklmnopqrstuvwxyz";
    String numberGenerate = "";
    Random random = Random();

    for (var i = 0; i < quantity; i++) {
      numberGenerate += chars[random.nextInt(chars.length)];
    }
    return numberGenerate;
  }

  String _generateRandomSpecialCharacters(int quantity) {
    String chars = r"!@#$%&*()";
    String numberGenerate = "";
    Random random = Random();

    for (var i = 0; i < quantity; i++) {
      numberGenerate += chars[random.nextInt(chars.length)];
    }
    return numberGenerate;
  }
}
