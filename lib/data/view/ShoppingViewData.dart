import 'package:ibu_negara/data/entity/ShoppingEntity.dart';
import 'package:ibu_negara/util/CurrencyUtils.dart';

class ShoppingViewData {
  final int id;
  String name;
  String price;
  bool isChecked;

  ShoppingViewData({
    this.id,
    this.name,
    this.price,
    this.isChecked,
  });

  factory ShoppingViewData.fromEntity(ShoppingEntity entity) {
    return ShoppingViewData(
      id: entity.id,
      name: entity.name,
      isChecked: entity.isChecked,
      price: entity.price,
    );
  }

  String get formattedPrice {
    return moneyFormatter(double.parse(price)).symbolOnLeft;
  }
}
