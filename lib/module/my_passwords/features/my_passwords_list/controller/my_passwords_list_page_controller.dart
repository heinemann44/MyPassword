import 'package:mobx/mobx.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/data/item_password.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/data/list_password_mock.dart';

part 'my_passwords_list_page_controller.g.dart';

class MyPasswordsListPageController = _MyPasswordsListPageControllerBase with _$MyPasswordsListPageController;

abstract class _MyPasswordsListPageControllerBase with Store{

  @observable
  ObservableList<ItemPassword> listItemPassword;

  initState(){
    this.listItemPassword = ListPasswordMock().validList();
  }

  @action
  void removeItem(int index){
    this.listItemPassword[index].isDeleted = true;
    this.listItemPassword.removeAt(index);
  }

}