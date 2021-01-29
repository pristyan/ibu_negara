import 'package:ibu_negara/data/entity/ShoppingEntity.dart';
import 'package:ibu_negara/data/entity/ShoppingListEntity.dart';

abstract class ShoppingDataSource {
  Future<ShoppingListEntity> getList();

  Future addItem(ShoppingEntity entity);

  Future updateItem(ShoppingEntity entity);

  Future deleteItem(int id);

  Future saveList(ShoppingListEntity list);
}