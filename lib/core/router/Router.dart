
import 'package:flutter/widgets.dart';
import 'package:ibu_negara/module/home/HomePage.dart';
import 'package:ibu_negara/module/shopping/ShoppingPage.dart';

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
  ShoppingPage.route : (BuildContext context) => ShoppingPage(),
  HomePage.route : (BuildContext context) => HomePage(),
};
