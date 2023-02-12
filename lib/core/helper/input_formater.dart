import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomInputFormatters {

  /// Just only input with format 2 decimal.
  /// * Example 3.00, 123.12, 133212.99, ...
  static List<TextInputFormatter>? numberWith2Decimals = [
    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\,?\d{0,2}')),
    TextInputFormatter.withFunction(
          (oldValue, newValue) => newValue.copyWith(
        text: newValue.text.replaceAll(',', '.'),
      ),
    ),
  ];

  static List<TextInputFormatter>? idrCurrency = [
    FilteringTextInputFormatter.digitsOnly,
    CurrencyInputFormatter(),
  ];

  static MaskTextInputFormatter maskNpwp({String? initialText}) {
    return MaskTextInputFormatter(
      mask: '##.###.###.#-###.###',
      filter: {"#": RegExp(r'[0-9]')},
      initialText: initialText,
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  static TextEditingValue defaultFormat(String text) {
    return CurrencyInputFormatter().formatEditUpdate(
      const TextEditingValue(text: ''),
      TextEditingValue(text: text),
    );
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if(oldValue.text == '0') {
      return newValue;
    }
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter =
    NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    String newText = formatter.format(value);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
