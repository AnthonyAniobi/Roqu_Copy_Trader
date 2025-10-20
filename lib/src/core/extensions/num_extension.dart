import 'package:intl/intl.dart';

extension NumExtension on num {
  String toMoneyFormat({int? decimalDigits, String? currencySymbol}) {
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: currencySymbol ?? '\$',
      decimalDigits: decimalDigits,
    );
    return formatter.format(this);
  }

  Duration get milliseconds => Duration(milliseconds: toInt());

  String get ordinal {
    if (!(this >= 1 && this <= 100)) {
      //here you change the range
      throw Exception('Invalid number');
    }

    if (this >= 11 && this <= 13) {
      return 'th';
    }

    String ord = switch (this % 10) {
      1 => 'st',
      2 => 'nd',
      3 => 'rd',
      _ => 'th',
    };
    return '${toInt()}$ord';
  }
}
