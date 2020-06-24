import 'package:mobx/mobx.dart';

part 'generate_password_form_controller.g.dart';

class GeneratePasswordFormController = _GeneratePasswordFormControllerBase with _$GeneratePasswordFormController;

abstract class _GeneratePasswordFormControllerBase with Store{

  @observable
  bool hasLetters;
  @observable
  bool hasNumbers;
  @observable
  bool hasSpecialCharacters;

  @action
  void onTapHasLetters(){
    this.hasLetters = !this.hasLetters;
  }

  @action
  void onTapHasNumbers(){
    this.hasNumbers = !this.hasNumbers;
  }

  @action
  void onTapHasSpacialCharacter(){
    this.hasSpecialCharacters = !this.hasSpecialCharacters;
  }
}