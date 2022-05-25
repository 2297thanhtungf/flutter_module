import 'package:flutter/material.dart' show TextField;
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

///
/// An implementation of [NumberInputFormatter] automatically inserts thousands
/// separators to numeric input. For example, a input of `1234` should be
/// formatted to `1,234`.
///
class ThousandsFormatter extends NumberInputFormatter {
  static final NumberFormat _formatter = NumberFormat.decimalPattern();

  final FilteringTextInputFormatter _decimalFormatter;
  final String _decimalSeparator;
  final RegExp _decimalRegex;

  // final NumberFormat formatter;
  final bool allowFraction;

  ThousandsFormatter({this.allowFraction = false})
      : _decimalSeparator = (_formatter).symbols.DECIMAL_SEP,
        _decimalRegex = RegExp(allowFraction
            ? '[0-9]+([${( _formatter).symbols.DECIMAL_SEP}])?'
            : r'\d+'),
        _decimalFormatter = FilteringTextInputFormatter.allow(RegExp(
            allowFraction
                ? '[0-9]+([${( _formatter).symbols.DECIMAL_SEP}])?'
                : r'\d+'));

  @override
  String _formatPattern(String digits) {
    if (digits == null || digits.isEmpty) return digits;
    final number = allowFraction
        ? double.tryParse(digits) ?? 0.0
        : int.tryParse(digits) ?? 0;
    final result = ( _formatter).format(number);
    if (allowFraction && digits.endsWith(_decimalSeparator)) {
      return '$result$_decimalSeparator';
    }
    return result;
  }

  @override
  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return _decimalFormatter.formatEditUpdate(oldValue, newValue);
  }
}

///
/// An implementation of [NumberInputFormatter] that converts a numeric input
/// to credit card number form (4-digit grouping). For example, a input of
/// `12345678` should be formatted to `1234 5678`.
///
///
/// An abstract class extends from [TextInputFormatter] and does numeric filter.
/// It has an abstract method `_format()` that lets its children override it to
/// format input displayed on [TextField]
///
///
abstract class NumberInputFormatter extends TextInputFormatter {
  late TextEditingValue _lastNewValue = new TextEditingValue(text: '',selection: TextSelection.collapsed(offset: -1),composing: TextRange.empty );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    /// nothing changes, nothing to do
    if (newValue.text.length == 12) {
      return oldValue;
    }
    if (newValue.text == _lastNewValue.text) {
      return newValue;
    }
    _lastNewValue = newValue;

    /// remove all invalid characters
    newValue = _formatValue(oldValue, newValue);

    final newText = _formatPattern(newValue.text).replaceAll(",", ".");
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
        composing: TextRange.empty);
  }

  /// format user input with pattern formatter
  String _formatPattern(String digits);

  /// validate user input
  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue);
}
