import 'package:flutter/material.dart';
import 'package:ibu_negara/resource/value/Colors.dart';
import 'package:ibu_negara/resource/style/TextStyle.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool enableNavBack;
  final Function onBackPress;
  final Widget leading;
  final Widget title;
  final PreferredSizeWidget bottom;
  final List<Widget> actions;
  final double elevation;

  DefaultAppBar({
    Key key,
    this.leading,
    this.title,
    this.enableNavBack,
    this.onBackPress,
    this.actions,
    this.elevation,
    this.bottom,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: color_primary,
      brightness: Brightness.dark,
      leading: leading,
      actions: actions,
      title: title,
      centerTitle: false,
      elevation: elevation,
      bottom: bottom,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(headline6: appbar_text_style),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
}
