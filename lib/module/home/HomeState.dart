import 'package:ibu_negara/core/base/BaseState.dart';
import 'package:ibu_negara/data/view/ShoppingViewData.dart';
import 'package:ibu_negara/util/CurrencyUtils.dart';

class HomeState extends BaseState {
  List<ShoppingViewData> shoppingList;

  String get totalPrice {
    int total = 0;
    shoppingList.forEach((item) {
      total += item.totalPrice;
    });

    return moneyFormatter(total.toDouble()).symbolOnLeft;
  }

  String get totalCheckedPrice {
    int total = 0;
    shoppingList.where((item) => item.isChecked).forEach((item) {
      total += item.totalPrice;
    });

    return moneyFormatter(total.toDouble()).symbolOnLeft;
  }

  String get totalUncheckedPrice {
    int total = 0;
    shoppingList.where((item) => !item.isChecked).forEach((item) {
      total += item.totalPrice;
    });

    return moneyFormatter(total.toDouble()).symbolOnLeft;
  }

  bool get isAnyItemChecked {
    if (shoppingList == null || shoppingList.isEmpty) return false;

    bool found = false;
    int i = 0;
    while (i < shoppingList.length && !found) {
      if (shoppingList[i].isChecked) {
        found = true;
      }
      i++;
    }
    return found;
  }
}
