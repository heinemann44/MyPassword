import 'package:mobx/mobx.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/data/item_password.dart';

class ListPasswordMock{

  ObservableList<ItemPassword> validList(){
    ObservableList<ItemPassword> list = ObservableList<ItemPassword>();
    list.addAll([
      ItemPassword(applicationName: "Gmail", password: "12314", showPassword: true, active: true),
      ItemPassword(applicationName: "Hotmail", password: "222212314", showPassword: true, active: true),
      ItemPassword(applicationName: "Dota", password: "cabo", showPassword: false, active: true),
      ItemPassword(applicationName: "Lol", password: "dsd", showPassword: false, active: true),
      ItemPassword(applicationName: "LUL", password: "fgj", showPassword: false, active: true),
      ItemPassword(applicationName: "4Head", password: "hgf", showPassword: false, active: true),
      ItemPassword(applicationName: "Clap", password: "fjh", showPassword: true, active: true),
    ]);

    return list;
  }
}