import 'package:intl/intl.dart';
import 'package:nasa_app_challenge/l10n/l10n.dart';

extension DateTimeFormatExt on DateTime {
  String dayMonthYear(AppLocalizations l10n) {
    final format = DateFormat('dd, MMM, ' 'yyyy', l10n.lang).format(this);
    return format
        .replaceRange(4, 5, format[4].toUpperCase())
        .replaceAll('.', '');
  }
}
