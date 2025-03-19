import 'package:intl/intl.dart';
import 'functions.dart';

abstract class Formatters {
  static formatDateFromBR(String? date) {
    if (date != null && date.indexOf("/") != -1) {
      date = date.split("/").reversed.join("-");
    }

    return date;
  }

  static formatDateToBR(String? date) {
    if (date != null && date.indexOf("-") != -1) {
      date = date.split("-").reversed.join("/");
    }

    return date;
  }

  static formatDateTimeToBR(String dateTime) {
    List split = dateTime.split(" ");

    return formatDateToBR(split[0]) + " " + split[1];
  }

  static stripZipCode(String zipCode) {
    return zipCode.replaceAll(RegExp(r'[.-]'), '');
  }

  static formatCurrency(dynamic value) {
    value = parseDouble(value ?? 0);
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(value);
  }

  static stripPhoneNumber(String phone) {
    if (phone.contains(r'+')) {
      phone = phone.substring(3);
    }

    return phone.replaceAll(RegExp(r"[^\d\w]"), "");
  }

  static onlyNumbers(String value) {
    return value.replaceAll(RegExp(r'\D'), "");
  }

  static String formatPhone(String? phone) {
    if (phone == null) return "N/A";

    if (phone.contains(r'+')) {
      phone = phone.substring(3);
    }

    phone = stripPhoneNumber(phone);

    List<String> chars = List.of(phone!.split(""));
    chars.insert(0, "(");
    chars.insert(3, ")");
    chars.insert(4, " ");
    chars.insert(10, "-");
    return chars.join("");
  }
}
