import 'package:ibu_negara/core/base/BaseState.dart';
import 'package:ibu_negara/data/view/ShoppingViewData.dart';
import 'package:ibu_negara/widget/DefaultWidget.dart';

class ShoppingState extends BaseState {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  ShoppingViewData data;

  ShoppingState({this.data});
}
