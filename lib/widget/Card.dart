import 'package:flutter/material.dart';
import 'package:ibu_negara/resource/value/Dimension.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;
  final ShapeBorder shape;
  final double elevation;

  MyCard({
    this.child,
    this.margin,
    this.elevation,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(spacing_normal)),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: shape,
      child: child,
      margin: margin,
      elevation: elevation,
    );
  }
}
