import 'package:flutter/widgets.dart';
import 'package:ibu_negara/core/base/BaseNotifier.dart';

abstract class BaseWidgetState<P extends StatefulWidget, N extends BaseNotifier> extends State<P> {
  N notifier;

  void initNotifier();

  @override
  void initState() {
    super.initState();
    initNotifier();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }
}
