import 'package:flutter/widgets.dart';
import 'package:ibu_negara/core/base/BaseNotifier.dart';
import 'package:ibu_negara/data/request/ShoppingRequest.dart';
import 'package:ibu_negara/module/shopping/ShoppingState.dart';
import 'package:ibu_negara/module/shopping/interactor/ShoppingInteractor.dart';
import 'package:ibu_negara/widget/Toast.dart';

class ShoppingNotifier extends BaseNotifier<ShoppingState> {
  final ShoppingInteractor interactor;

  ShoppingNotifier({
    @required BuildContext context,
    @required ShoppingState state,
    @required this.interactor,
  }) : super(context: context, state: state) {
    if (state.data != null) {
      state.nameController.text = state.data.name;
      state.priceController.text = state.data.formattedPrice;
      state.amountController.text = state.data.formattedAmount;
    }
  }

  bool isValidInput() {
    if (state.nameController.text.isEmpty) {
      showToast("Nama tidak boleh kosong bund");
      return false;
    }

    return true;
  }

  ShoppingRequest get shoppingRequest {
    var price = state.priceController.text
        .replaceAll("Rp", "")
        .replaceAll(",", "")
        .replaceAll(".", "")
        .trim();

    var amount = state.amountController.text;

    return ShoppingRequest(
      id: state.data != null ? state.data.id : null,
      name: state.nameController.text,
      price: price.isEmpty ? "0" : price,
      amount: (amount.isEmpty || amount == "0") ? 1 : int.parse(amount),
      isChecked: state.data == null ? false : state.data.isChecked ?? false,
    );
  }

  void addItem() async {
    if (!isValidInput()) return;

    state.isLoading = true;
    notifyListeners();

    await interactor.addItem(shoppingRequest);

    state.isLoading = false;
    notifyListeners();

    showToast("Item berhasil ditambahkan");
    Navigator.pop(context);
  }

  void updateItem() async {
    if (!isValidInput()) return;

    state.isLoading = true;
    notifyListeners();

    await interactor.updateItem(shoppingRequest);

    state.isLoading = false;
    notifyListeners();

    showToast("Item berhasil diperbarui");
    Navigator.pop(context);
  }

  void deleteItem() async {
    state.isLoading = true;
    notifyListeners();

    await interactor.deleteItem(state.data.id);
    state.isLoading = false;
    notifyListeners();

    showToast("Item berhasil dihapus");
    Navigator.pop(context);
  }

  @override
  void dispose() {
    state.nameController.dispose();
    state.priceController.dispose();
    super.dispose();
  }
}
