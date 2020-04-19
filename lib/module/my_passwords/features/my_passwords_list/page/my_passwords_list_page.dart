import 'package:flutter/material.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/page/my_passwords_item.dart';

class MyPasswordListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My passwords"),
      ),
      body: this._buildContentBody(),
    );
  }

  Widget _buildContentBody() {
    return SafeArea(
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: this._buildListPasswords(),
        ),
      ),
    );
  }

  Widget _buildListPasswords() {
    return ListView.separated(
      itemBuilder: (_, index) => MyPasswordItem(
        icon: Icon(
          Icons.insert_emoticon,
          size: 60,
        ),
        name: "Aplication name123: $index",
        password: "123456",
      ),
      separatorBuilder: (_, index) => Divider(
        color: Colors.blueGrey,
        thickness: 0.5,
      ),
      itemCount: 10,
    );
  }
}
