import 'package:ibu_negara/data/request/ShoppingRequest.dart';
import 'package:ibu_negara/data/view/ShoppingViewData.dart';

abstract class HomeInteractor {
  Future<List<ShoppingViewData>> getShoppingList();

  Future checkItem(ShoppingRequest request);

  Future saveReorderedList(List<ShoppingViewData> list);
}
