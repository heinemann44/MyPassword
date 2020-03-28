import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/controller/my_passwords_item_controller.dart';

class MyPasswordItem extends StatefulWidget {
  final Widget icon;
  final double widthIcon;
  final String name;
  final String password;

  const MyPasswordItem({
    Key key,
    this.icon,
    this.widthIcon = 50,
    this.name,
    this.password,
  }) : super(key: key);

  @override
  _MyPasswordItemState createState() => _MyPasswordItemState();
}

class _MyPasswordItemState extends State<MyPasswordItem> {
  MyPasswordItemController _controller = MyPasswordItemController();

  @override
  void initState() {
    this._controller.visible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: this._buildIcon(),
      title: this._buildName(),
      subtitle: this._buildPassword(),
      trailing: this._buildVisibilityButton(),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: this.widget.widthIcon,
      height: this.widget.widthIcon,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Center(child: this.widget.icon),
      ),
    );
  }

  Widget _buildName() {
    return Row(
      children: <Widget>[
        Flexible(
          child: Text(
            this.widget.name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildPassword() {
    return Row(
      children: <Widget>[
        Flexible(
          child: Observer(
            builder: (_) => Text(
              this._controller.visible ? this.widget.password : " * * * * * ",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVisibilityButton() {
    return Observer(
      builder: (_) => IconButton(
        icon: Icon(
          this._controller.visible ? Icons.visibility : Icons.visibility_off,
        ),
        iconSize: 30,
        onPressed: this._controller.changeVisibility,
      ),
    );
  }
}
