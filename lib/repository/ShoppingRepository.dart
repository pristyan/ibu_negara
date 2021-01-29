import 'dart:convert';

import 'package:ibu_negara/data/entity/ShoppingEntity.dart';
import 'package:ibu_negara/data/entity/ShoppingListEntity.dart';
import 'package:ibu_negara/repository/ShoppingDataSource.dart';
import 'package:ibu_negara/util/PreferenceUtils.dart';

class ShoppingRepository implements ShoppingDataSource {
  static const String KEY_ITEM_LIST = "KEY_ITEM_LIST";

  @override
  Future addItem(ShoppingEntity entity) async {
    entity.id = DateTime.now().microsecondsSinceEpoch;
    var list = await getList();
    list.data.add(entity);
    await saveList(list);
  }

  @override
  Future deleteItem(int id) async {
    var list = await getList();
    var index = list.data.indexWhere((e) => e.id == id);
    list.data.removeAt(index);
    await saveList(list);
  }

  @override
  Future<ShoppingListEntity> getList() async {
    var result = await PreferenceUtils.getString(KEY_ITEM_LIST);
    if (result == null || result.isEmpty) {
      return ShoppingListEntity(data: List());
    } else {
      return ShoppingListEntity.fromJson(jsonDecode(result));
    }
  }

  @override
  Future updateItem(ShoppingEntity entity) async {
    var list = await getList();
    var index = list.data.indexWhere((e) => e.id == entity.id);
    list.data[index] = entity;
    await saveList(list);
  }

  @override
  Future saveList(ShoppingListEntity list) async {
    await PreferenceUtils.putString(KEY_ITEM_LIST, list.toString());
  }
}
