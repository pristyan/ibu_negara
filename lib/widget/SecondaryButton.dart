
import 'package:flutter/material.dart';
import 'package:ibu_negara/resource/style/TextStyle.dart';
import 'package:ibu_negara/resource/value/Colors.dart';
import 'package:ibu_negara/resource/value/Dimension.dart';

class SecondaryButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double width;
  final double height;
  final Widget child;
  final Color color;

  SecondaryButton({
    Key key,
    this.width,
    this.height,
    this.text,
    this.child,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? button_height,
      child: FlatButton(
        onPressed: onTap,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: color_primary,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(spacing_normal)),
        ),
        disabledColor: color_disabled_button,
        child: Builder(builder: (_) {
          if (child != null) {
            return child;
          } else {
            return Text(text.toUpperCase(), style: secondary_btn_text_style, maxLines: 1);
          }
        }),
      ),
    );
  }
}
