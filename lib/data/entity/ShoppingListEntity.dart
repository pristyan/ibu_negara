import 'dart:convert';

import 'package:ibu_negara/data/entity/ShoppingEntity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ShoppingListEntity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ShoppingListEntity {

  List<ShoppingEntity> data;

  ShoppingListEntity({this.data});

  factory ShoppingListEntity.fromJson(Map<String, dynamic> json) => _$ShoppingListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this.toJson());
  }
}
