import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';

MoneyFormatterOutput moneyFormatter(double value) {
  return FlutterMoneyFormatter(
    amount: (value != null ? value : 0.0),
    settings: MoneyFormatterSettings(
      symbol: "Rp",
      thousandSeparator: ".",
      decimalSeparator: ",",
      symbolAndNumberSeparator: " ",
      fractionDigits: 0,
    ),
  ).output;
}

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.currency(locale: "id", symbol: "Rp ", decimalDigits: 0);

    String newText = formatter.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
