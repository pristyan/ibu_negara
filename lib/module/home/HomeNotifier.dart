import 'package:flutter/widgets.dart';
import 'package:ibu_negara/core/base/BaseNotifier.dart';
import 'package:ibu_negara/data/request/ShoppingRequest.dart';
import 'package:ibu_negara/data/view/ShoppingViewData.dart';
import 'package:ibu_negara/module/home/HomeState.dart';
import 'package:ibu_negara/module/home/interactor/HomeInteractor.dart';
import 'package:ibu_negara/module/shopping/ShoppingPage.dart';
import 'package:ibu_negara/util/NavigationUtils.dart';

class HomeNotifier extends BaseNotifier<HomeState> {
  final HomeInteractor interactor;

  HomeNotifier({
    @required BuildContext context,
    @required HomeState state,
    @required this.interactor,
  }) : super(context: context, state: state) {
    getList();
  }

  void getList() async {
    state.isLoading = true;
    state.shoppingList = List();
    notifyListeners();

    state.shoppingList = await interactor.getShoppingList();
    state.isLoading = false;

    notifyListeners();
  }

  void onItemChecked(ShoppingViewData data) async {
    await interactor.checkItem(ShoppingRequest.fromViewData(data));
    getList();
  }

  void onItemTap(ShoppingViewData data) async {
    await Navigate.to(
      context,
      ShoppingPage(data: data, action: ShoppingAction.UPDATE),
      ShoppingPage.route,
    );

    getList();
  }

  void onNewItem() async {
    await Navigate.to(
      context,
      ShoppingPage(action: ShoppingAction.ADD),
      ShoppingPage.route,
    );

    getList();
  }

  void deleteSelectedItems() async {
    state.shoppingList.removeWhere((item) => item.isChecked);
    await interactor.saveReorderedList(state.shoppingList);
    getList();
  }

  void reorderList(int oldIndex, int newIndex) async {
    var temp = state.shoppingList[oldIndex];
    state.shoppingList.removeAt(oldIndex);
    state.shoppingList.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, temp);

    await interactor.saveReorderedList(state.shoppingList);
    getList();
  }
}
