import 'dart:convert';

import 'package:ibu_negara/data/request/ShoppingRequest.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ShoppingEntity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ShoppingEntity {
  int id;
  String name;
  String price;
  bool isChecked;

  ShoppingEntity({
    this.id,
    this.name,
    this.price,
    this.isChecked,
  });

  factory ShoppingEntity.fromJson(Map<String, dynamic> json) => _$ShoppingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingEntityToJson(this);

  factory ShoppingEntity.fromRequest(ShoppingRequest request) {
    return ShoppingEntity(
      id: request.id,
      name: request.name,
      price: request.price,
      isChecked: request.isChecked,
    );
  }

  @override
  String toString() {
    return jsonEncode(this.toJson());
  }
}
