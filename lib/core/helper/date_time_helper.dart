import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skybase/core/helper/extension/datetime_extension.dart';

import 'locale_callback.dart';

class DateTimeHelper {
  static String parseLocalDate({
    required DateTime? date,
    String? format,
    String? idFormat,
  }) {
    if (date != null) {
      return LocaleCallback.builder(
        enCallback: DateFormat(format).format(date),
        idCallback: DateFormat(idFormat ?? format, 'id').format(date),
      );
    } else {
      return 'Date is null';
    }
  }

  static String dateToSentence(DateTime date) {
    if (date.inThisHours()) {
      int intDateTime = date.difference(DateTime.now()).inMinutes;
      if (intDateTime <= 0) {
        return 'txt_expired'.tr;
      } else {
        return '$intDateTime ${'txt_minutes'.tr}';
      }
    } else if (date.isToday()) {
      return '${date.difference(DateTime.now()).inHours} ${'txt_hours'.tr}';
    } else if (date.inNextWeek()) {
      return '${date.difference(DateTime.now()).inDays + 1} ${'txt_days'.tr}';
    } else if (date.inThisYear()) {
      return parseLocalDate(date: date, format: 'dd MMM');
    } else {
      return parseLocalDate(date: date, format: 'dd/MM/y');
    }
  }

  static String dateToSentenceInDay({required DateTime date, String? format}) {
    if (date.isToday()) {
      return 'txt_today'.tr;
    } else if (date.isYesterday()) {
      return 'txt_yesterday'.tr;
    } else if (date.isTomorrow()) {
      return 'txt_tommorow'.tr;
    } else {
      return parseLocalDate(date: date, format: format ?? 'dd MMM');
    }
  }
}

