import 'package:ibu_negara/data/view/ShoppingViewData.dart';

class ShoppingRequest {
  int id;
  String name;
  String price;
  int amount;
  bool isChecked;

  ShoppingRequest({
    this.id,
    this.name,
    this.price,
    this.amount,
    this.isChecked,
  });

  factory ShoppingRequest.fromViewData(ShoppingViewData data) {
    return ShoppingRequest(
      id: data.id,
      name: data.name,
      price: data.price,
      isChecked: data.isChecked,
      amount: data.amount ?? 1,
    );
  }
}
