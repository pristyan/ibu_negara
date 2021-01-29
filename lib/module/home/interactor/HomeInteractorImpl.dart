import 'package:ibu_negara/data/entity/ShoppingEntity.dart';
import 'package:ibu_negara/data/entity/ShoppingListEntity.dart';
import 'package:ibu_negara/data/request/ShoppingRequest.dart';
import 'package:ibu_negara/data/view/ShoppingViewData.dart';
import 'package:ibu_negara/module/home/interactor/HomeInteractor.dart';
import 'package:ibu_negara/repository/ShoppingDataSource.dart';
import 'package:ibu_negara/widget/DefaultWidget.dart';

class HomeInteractorImpl implements HomeInteractor {
  final ShoppingDataSource dataSource;

  HomeInteractorImpl({@required this.dataSource});

  @override
  Future checkItem(ShoppingRequest request) async {
    var entity = ShoppingEntity.fromRequest(request);
    await dataSource.updateItem(entity);
  }

  @override
  Future<List<ShoppingViewData>> getShoppingList() async {
    var listEntity = await dataSource.getList();
    List<ShoppingViewData> list = List();
    listEntity.data.forEach((entity) => list.add(ShoppingViewData.fromEntity(entity)));
    return list;
  }

  @override
  Future saveReorderedList(List<ShoppingViewData> list) async {
    var listEntity = ShoppingListEntity(data: List());
    listEntity.data.addAll(
      list.map(
        (e) => ShoppingEntity(
          id: e.id,
          name: e.name,
          price: e.price,
          isChecked: e.isChecked,
        ),
      ),
    );

    await dataSource.saveList(listEntity);
  }
}
