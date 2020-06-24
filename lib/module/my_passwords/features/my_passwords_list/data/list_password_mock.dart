import 'package:mobx/mobx.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/data/item_password.dart';

class ListPasswordMock{

  ObservableList<ItemPassword> validList(){
    ObservableList<ItemPassword> list = ObservableList<ItemPassword>();
    list.addAll([
      ItemPassword(applicationName: "Gmail", password: "12314", showPassword: true, isDeleted: true),
      ItemPassword(applicationName: "Hotmail", password: "222212314", showPassword: true, isDeleted: true),
      ItemPassword(applicationName: "Dota", password: "cabo", showPassword: false, isDeleted: true),
      ItemPassword(applicationName: "Lol", password: "dsd", showPassword: false, isDeleted: true),
      ItemPassword(applicationName: "LUL", password: "fgj", showPassword: false, isDeleted: true),
      ItemPassword(applicationName: "4Head", password: "hgf", showPassword: false, isDeleted: true),
      ItemPassword(applicationName: "Clap", password: "fjh", showPassword: true, isDeleted: true),
    ]);

    return list;
  }
}