import 'package:easy_localization/easy_localization.dart';

class AppDateUtils {
  static String? format({
    required String format,
    String? locale,
    DateTime? date,
  }) {
    return date == null ? null : DateFormat(format, locale).format(date);
  }
}
