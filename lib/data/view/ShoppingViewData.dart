import 'package:ibu_negara/data/entity/ShoppingEntity.dart';
import 'package:ibu_negara/util/CurrencyUtils.dart';

class ShoppingViewData {
  final int id;
  String name;
  String price;
  int amount;
  bool isChecked;

  ShoppingViewData({
    this.id,
    this.name,
    this.price,
    this.amount,
    this.isChecked,
  });

  factory ShoppingViewData.fromEntity(ShoppingEntity entity) {
    return ShoppingViewData(
      id: entity.id,
      name: entity.name,
      isChecked: entity.isChecked,
      price: entity.price,
      amount: (entity.amount == null || entity.amount == 0) ? 1 : entity.amount,
    );
  }

  String get formattedPrice {
    return moneyFormatter(double.parse(price)).symbolOnLeft;
  }

  String get formattedAmount {
    return amount.toString();
  }

  int get totalPrice {
    return int.parse(price) * amount;
  }

  String get formattedTotalPrice {
    var total = int.parse(price) * amount;
    return moneyFormatter(total.toDouble()).symbolOnLeft;
  }

  String get formattedAmountPrice {
    return "$amount x @$formattedPrice";
  }
}
