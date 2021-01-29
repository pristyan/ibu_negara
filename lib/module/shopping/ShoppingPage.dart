import 'package:flutter/services.dart';
import 'package:ibu_negara/core/base/BaseWidgetState.dart';
import 'package:ibu_negara/data/view/ShoppingViewData.dart';
import 'package:ibu_negara/module/shopping/ShoppingNotifier.dart';
import 'package:ibu_negara/module/shopping/ShoppingState.dart';
import 'package:ibu_negara/module/shopping/interactor/ShoppingInteractorImpl.dart';
import 'package:ibu_negara/repository/ShoppingRepository.dart';
import 'package:ibu_negara/util/CurrencyUtils.dart';
import 'package:ibu_negara/widget/Card.dart';
import 'package:ibu_negara/widget/DefaultWidget.dart';
import 'package:ibu_negara/widget/FilledInput.dart';
import 'package:ibu_negara/widget/SecondaryButton.dart';

enum ShoppingAction { ADD, UPDATE }

class ShoppingPage extends StatefulWidget {
  static const route = "ShoppingPage";

  final ShoppingViewData data;
  final ShoppingAction action;

  ShoppingPage({this.data, this.action});

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends BaseWidgetState<ShoppingPage, ShoppingNotifier> {
  @override
  void initNotifier() {
    notifier = ShoppingNotifier(
      context: context,
      state: ShoppingState(data: widget.data),
      interactor: ShoppingInteractorImpl(dataSource: ShoppingRepository()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: notifier,
      child: Consumer<ShoppingNotifier>(builder: (_, __, ___) {
        return Scaffold(
          appBar: DefaultAppBar(
            title: Text(
              widget.action == ShoppingAction.UPDATE ? "Ubah Catatan" : "Tambah Catatan",
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: spacing_medium),
                MyCard(
                  margin: EdgeInsets.all(spacing_medium),
                  child: Container(
                    padding: EdgeInsets.all(spacing_medium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama", style: bold_label_text_style),
                        SizedBox(height: spacing_small),
                        FilledInputText(
                          hint: "Contoh : Rinso",
                          minLines: 1,
                          maxLines: 3,
                          controller: notifier.state.nameController,
                          textInputType: TextInputType.text,
                          capitalization: TextCapitalization.words,
                        ),
                        SizedBox(height: spacing_medium),
                        Text("Harga", style: bold_label_text_style),
                        SizedBox(height: spacing_small),
                        FilledInputText(
                          hint: "Rp 0",
                          controller: notifier.state.priceController,
                          textInputType: TextInputType.number,
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            CurrencyInputFormatter(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(spacing_medium),
                  child: PrimaryButton(
                    width: double.infinity,
                    text: "Simpan",
                    onTap: widget.action == ShoppingAction.UPDATE
                        ? notifier.updateItem
                        : notifier.addItem,
                  ),
                ),
                Visibility(
                  visible: widget.action == ShoppingAction.UPDATE,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: spacing_medium,
                      right: spacing_medium,
                      bottom: spacing_medium,
                    ),
                    child: SecondaryButton(
                      width: double.infinity,
                      text: "Hapus",
                      onTap: notifier.deleteItem,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
