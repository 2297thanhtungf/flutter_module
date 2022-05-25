import 'package:intl/intl.dart';

String convertToCurrency(int amount) {
  final formatter =  NumberFormat("#,###", "en_US");
  return formatter.format(amount).replaceAll(',', '.') + "₫";
}
