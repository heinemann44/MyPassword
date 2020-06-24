import 'package:my_password/module/generate_password/features/generate_password/data/repository/database_creator_password.dart';

class ItemPassword {
  int id;
  String applicationName;
  String password;
  bool showPassword;
  bool isDeleted;

  ItemPassword({
    this.id,
    this.applicationName,
    this.password,
    this.showPassword,
    this.isDeleted,
  });

  ItemPassword.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreatorPassword.id];
    this.applicationName = json[DatabaseCreatorPassword.applicationName];
    this.password = json[DatabaseCreatorPassword.password];
    this.showPassword = json[DatabaseCreatorPassword.showPassword] == 1;
    this.isDeleted = json[DatabaseCreatorPassword.isDeleted] == 1;
  }
}
