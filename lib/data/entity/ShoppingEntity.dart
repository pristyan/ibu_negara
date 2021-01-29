import 'dart:convert';

import 'package:ibu_negara/data/request/ShoppingRequest.dart';
import 'package:ibu_negara/data/view/ShoppingViewData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ShoppingEntity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ShoppingEntity {
  int id;
  String name;
  String price;
  bool isChecked;
  int amount;

  ShoppingEntity({
    this.id,
    this.name,
    this.price,
    this.isChecked,
    this.amount,
  });

  factory ShoppingEntity.fromJson(Map<String, dynamic> json) => _$ShoppingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingEntityToJson(this);

  factory ShoppingEntity.fromRequest(ShoppingRequest request) {
    return ShoppingEntity(
      id: request.id,
      name: request.name,
      amount: request.amount,
      price: request.price,
      isChecked: request.isChecked,
    );
  }

  factory ShoppingEntity.fromViewData(ShoppingViewData data) {
    return ShoppingEntity(
      id: data.id,
      name: data.name,
      amount: data.amount ?? 1,
      price: data.price,
      isChecked: data.isChecked,
    );
  }

  @override
  String toString() {
    return jsonEncode(this.toJson());
  }
}
