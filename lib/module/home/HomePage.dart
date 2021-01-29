import 'package:ibu_negara/core/base/BaseWidgetState.dart';
import 'package:ibu_negara/module/home/HomeNotifier.dart';
import 'package:ibu_negara/module/home/HomeState.dart';
import 'package:ibu_negara/module/home/interactor/HomeInteractorImpl.dart';
import 'package:ibu_negara/module/home/view/HomeBottomSheet.dart';
import 'package:ibu_negara/module/home/view/ShoppingListItem.dart';
import 'package:ibu_negara/repository/ShoppingRepository.dart';
import 'package:ibu_negara/widget/DefaultWidget.dart';

class HomePage extends StatefulWidget {
  static const route = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseWidgetState<HomePage, HomeNotifier> {
  @override
  void initNotifier() {
    notifier = HomeNotifier(
      context: context,
      state: HomeState(),
      interactor: HomeInteractorImpl(dataSource: ShoppingRepository()),
    );
  }

  Widget get _emptyContainer {
    return Container(
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Belum ada catetan bund", style: input_text_style),
            SizedBox(height: spacing_medium),
            PrimaryButton(
              text: "Tambah di sini",
              onTap: notifier.onNewItem,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _loadingContainer {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget get _listButtonContainer {
    return InkWell(
      onTap: notifier.onNewItem,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: spacing_medium),
        child: Column(
          children: [
            SizedBox(height: spacing_medium),
            Row(
              children: [
                SizedBox(width: 12),
                Icon(
                  Icons.add_rounded,
                  color: color_disabled_button,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Tambah item, tekan di sini",
                    style: input_text_style.copyWith(
                      color: color_disabled_button,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: spacing_medium),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _dataContainer {
    return ReorderableListView(
      children: notifier.state.shoppingList.map(
        (item) => ShoppingListItem(
          key: ValueKey(item),
          data: item,
          onItemCheck: notifier.onItemChecked,
          onItemTap: notifier.onItemTap,
        ),
      ).toList(),
      header: _listButtonContainer,
      onReorder: notifier.reorderList,
      scrollDirection: Axis.vertical,
    );
  }

  Widget get _actionAdd {
    return InkWell(
      onTap: notifier.onNewItem,
      child: Container(
        padding: EdgeInsets.all(spacing_content),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: icon_normal,
        ),
      ),
    );
  }

  Widget get _actionDelete {
    return Visibility(
      visible: notifier.state.isAnyItemChecked,
      child: InkWell(
        onTap: notifier.deleteSelectedItems,
        child: Container(
          padding: EdgeInsets.all(spacing_content),
          child: Icon(
            Icons.delete_rounded,
            color: Colors.white,
            size: icon_normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: notifier,
      child: Consumer<HomeNotifier>(builder: (_, __, ___) {
        return Scaffold(
          appBar: DefaultAppBar(
            title: Text("CATETAN IBU NEGARA!"),
            actions: [_actionDelete, _actionAdd],
          ),
          body: Builder(builder: (context) {
            if (notifier.state.isLoading) {
              return _loadingContainer;
            }

            if (notifier.state.shoppingList != null && notifier.state.shoppingList.isNotEmpty) {
              return _dataContainer;
            }

            if (notifier.state.shoppingList.isEmpty) {
              return _emptyContainer;
            }

            return Container(height: 0);
          }),
          bottomSheet: Builder(builder: (_) {
            if (notifier.state.shoppingList != null && notifier.state.shoppingList.isNotEmpty) {
              return HomeBottomSheet(
                totalCheckedPrice: notifier.state.totalCheckedPrice,
                totalPrice: notifier.state.totalPrice,
                totalUncheckedPrice: notifier.state.totalUncheckedPrice,
              );
            }

            return Container(height: 0);
          }),
        );
      }),
    );
  }
}
