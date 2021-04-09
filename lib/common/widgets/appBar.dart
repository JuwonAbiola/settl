import 'package:flutter/material.dart';
import 'package:settle/common/widgets/buttons.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size preferredSize;

  String title;

  List<Widget> actions;
  Widget leading;

  CustomAppBar({
    Key key,
    this.title,
    this.actions,
    this.leading,
  })  : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: leading,
      ),
      backgroundColor: Colors.white,
      actions: actions,
      automaticallyImplyLeading: true,
    );
  }
}
