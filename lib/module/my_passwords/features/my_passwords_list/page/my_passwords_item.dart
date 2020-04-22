import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_password/module/my_passwords/features/my_passwords_list/controller/my_passwords_item_controller.dart';

class MyPasswordItem extends StatefulWidget {
  final Widget icon;
  final double widthIcon;
  final MyPasswordItemController controller;

  const MyPasswordItem({
    Key key,
    this.icon,
    this.widthIcon = 50,
    this.controller,
  }) : super(key: key);

  @override
  _MyPasswordItemState createState() => _MyPasswordItemState();
}

class _MyPasswordItemState extends State<MyPasswordItem> {
  MyPasswordItemController _controller;

  @override
  void initState() {
    this._controller = this.widget.controller;
    this._controller ??= MyPasswordItemController();
    this._controller.initState();
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
            this._controller.itemPassword.applicationName,
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
              this._controller.showPassword? this._controller.itemPassword.password : " * * * * * ",
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
          this._controller.showPassword ? Icons.visibility : Icons.visibility_off,
        ),
        iconSize: 30,
        onPressed: this._controller.changeVisibility,
      ),
    );
  }
}
