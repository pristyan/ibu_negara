import 'package:ibu_negara/data/request/ShoppingRequest.dart';

abstract class ShoppingInteractor {
  Future addItem(ShoppingRequest request);
  Future updateItem(ShoppingRequest request);
  Future deleteItem(int id);
}