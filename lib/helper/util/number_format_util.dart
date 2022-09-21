import 'package:intl/intl.dart';

extension IntOptFormatEx on int? {
  static final commaFormater = NumberFormat('#,###');

  String format() {
    if (this == null) {
      return '--';
    }

    return commaFormater.format(this);
  }

  String signFormat() {
    if (this == null) {
      return '--';
    }

    final value = commaFormater.format(this);

    return this! > 0 ? '+$value' : value;
  }
}
