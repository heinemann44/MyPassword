import 'package:mobx/mobx.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/data/item_password.dart';

part 'my_passwords_item_controller.g.dart';

class MyPasswordItemController = _MyPasswordItemControllerBase
    with _$MyPasswordItemController;

abstract class _MyPasswordItemControllerBase with Store {
  ItemPassword itemPassword;

  @observable
  String applicationName;
  @observable
  String password;
  @observable
  bool showPassword;
  @observable
  bool active;

  void initState(){
    this.applicationName = this.itemPassword.applicationName;
    this.password = this.itemPassword.password;
    this.showPassword = this.itemPassword.showPassword;
    this.active = !this.itemPassword.isDeleted;
  }

  @action
  void changeVisibility() {
    this.showPassword = !this.showPassword;
    this.itemPassword.showPassword = !this.itemPassword.showPassword;
  }
}
