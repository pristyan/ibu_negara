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
    }
  }

  bool isValidInput() {
    if (state.nameController.text.isEmpty) {
      showToast("Nama tidak boleh kosong bund");
      return false;
    }

    return true;
  }

  void addItem() async {
    if (!isValidInput()) return;

    var price = state.priceController.text
        .replaceAll("Rp", "")
        .replaceAll(",", "")
        .replaceAll(".", "")
        .trim();

    var request = ShoppingRequest(
      name: state.nameController.text,
      price: price.isEmpty ? "0" : price,
      isChecked: false,
    );

    state.isLoading = true;
    notifyListeners();

    await interactor.addItem(request);

    state.isLoading = false;
    notifyListeners();

    showToast("Item berhasil ditambahkan");
    Navigator.pop(context);
  }

  void updateItem() async {
    if (!isValidInput()) return;

    var request = ShoppingRequest(
      id: state.data.id,
      isChecked: state.data.isChecked,
      name: state.nameController.text,
      price: state.priceController.text
          .replaceAll("Rp", "")
          .replaceAll(",", "")
          .replaceAll(".", "")
          .trim(),
    );

    state.isLoading = true;
    notifyListeners();

    await interactor.updateItem(request);

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
