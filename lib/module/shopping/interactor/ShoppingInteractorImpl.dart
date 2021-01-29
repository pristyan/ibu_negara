import 'package:ibu_negara/data/entity/ShoppingEntity.dart';
import 'package:ibu_negara/data/request/ShoppingRequest.dart';
import 'package:ibu_negara/module/shopping/interactor/ShoppingInteractor.dart';
import 'package:ibu_negara/repository/ShoppingDataSource.dart';
import 'package:ibu_negara/widget/DefaultWidget.dart';

class ShoppingInteractorImpl implements ShoppingInteractor {
  final ShoppingDataSource dataSource;

  ShoppingInteractorImpl({@required this.dataSource});

  @override
  Future addItem(ShoppingRequest request) async {
    var entity = ShoppingEntity.fromRequest(request);
    await dataSource.addItem(entity);
  }

  @override
  Future deleteItem(int id) async {
    await dataSource.deleteItem(id);
  }

  @override
  Future updateItem(ShoppingRequest request) async {
    var entity = ShoppingEntity.fromRequest(request);
    await dataSource.updateItem(entity);
  }


}