import 'package:my_password/module/generate_password/features/generate_password/data/repository/database_creator_password.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/data/item_password.dart';

class RepositoryServicePassword {
  static Future<List<ItemPassword>> getAll() async {
    final sql = '''
    SELECT * 
    FROM ${DatabaseCreatorPassword.tableName}
    WHERE ${DatabaseCreatorPassword.isDeleted} = 0
    ''';

    final data = await db.rawQuery(sql);
    List<ItemPassword> passwords = List();

    data.forEach((item) {
      final password = ItemPassword.fromJson(item);
      passwords.add(password);
    });

    return passwords;
  }

  static Future<ItemPassword> getByID(int id) async {
    final sql = '''
    SELECT * 
    FROM ${DatabaseCreatorPassword.tableName}
    WHERE ${DatabaseCreatorPassword.id} = ?
    ''';

    List<dynamic> params = [id];
    final List<Map<String, dynamic>> data = await db.rawQuery(sql, params);

    return ItemPassword.fromJson(data.first);
  }

  static Future<void> add(ItemPassword password) async {
    final sql = '''INSERT INTO ${DatabaseCreatorPassword.tableName}
    (
      ${DatabaseCreatorPassword.id},
      ${DatabaseCreatorPassword.applicationName},
      ${DatabaseCreatorPassword.password},
      ${DatabaseCreatorPassword.showPassword},
      ${DatabaseCreatorPassword.isDeleted}
    )
    VALUES (?,?,?,?,?)''';
    List<dynamic> params = [
      password.id,
      password.applicationName,
      password.password,
      password.showPassword ? 1 : 0,
      password.isDeleted ? 1 : 0
    ];
    final result = await db.rawInsert(sql, params);
    DatabaseCreatorPassword.databaseLog(
        'Add password', sql, null, result, params);
  }

  static Future<void> delete(ItemPassword password) async {
    final sql = '''UPDATE ${DatabaseCreatorPassword.tableName}
    SET ${DatabaseCreatorPassword.isDeleted} = 1
    WHERE ${DatabaseCreatorPassword.id} = ?
    ''';

    List<dynamic> params = [password.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreatorPassword.databaseLog(
        'Delete password', sql, null, result, params);
  }

  static Future<void> update(ItemPassword password) async {
    final sql = '''UPDATE ${DatabaseCreatorPassword.tableName}
    SET ${DatabaseCreatorPassword.applicationName} = ?,
    ${DatabaseCreatorPassword.password} = ?,
    ${DatabaseCreatorPassword.showPassword} = ?,
    WHERE ${DatabaseCreatorPassword.id} = ?
    ''';

    List<dynamic> params = [
      password.applicationName,
      password.password,
      password.showPassword,
      password.id
    ];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreatorPassword.databaseLog(
        'Update password', sql, null, result, params);
  }

  static Future<int> count() async {
    final data = await db.rawQuery(
        '''SELECT COUNT(*) FROM ${DatabaseCreatorPassword.tableName}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
