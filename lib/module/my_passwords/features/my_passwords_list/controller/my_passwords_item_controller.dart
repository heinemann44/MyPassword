import 'package:mobx/mobx.dart';

part 'my_passwords_item_controller.g.dart';

class MyPasswordItemController = _MyPasswordItemControllerBase with _$MyPasswordItemController;

abstract class _MyPasswordItemControllerBase with Store{

  @observable
  bool visible;

  @action
  void changeVisibility(){
    this.visible = !this.visible;
  }
}