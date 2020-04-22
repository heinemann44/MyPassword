import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/controller/my_passwords_item_controller.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/controller/my_passwords_list_page_controller.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/page/my_passwords_item.dart';

class MyPasswordListPage extends StatefulWidget {
  @override
  _MyPasswordListPageState createState() => _MyPasswordListPageState();
}

class _MyPasswordListPageState extends State<MyPasswordListPage> {
  MyPasswordsListPageController _controller;

  @override
  void initState() {
    this._controller = MyPasswordsListPageController();
    this._controller.initState();
    super.initState();
  }

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
    return Observer(
      builder: (_) => ListView.separated(
          itemBuilder: (_, index) => this._buildItemPassword(index),
          separatorBuilder: (_, index) => Divider(
            color: Colors.blueGrey,
            thickness: 0.5,
          ),
          itemCount: this._controller.listItemPassword.length,
      ),
    );
  }

  Widget _buildItemPassword(int index) {
    MyPasswordItemController controller = MyPasswordItemController();
    controller.itemPassword = this._controller.listItemPassword[index];

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (DismissDirection direction){
          this._controller.removeItem(index);
      },

      direction: DismissDirection.endToStart,
      child: MyPasswordItem(
        icon: Icon(Icons.insert_emoticon, size: 60),
        controller: controller,
      ),
    );
  }
}
