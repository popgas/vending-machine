int parseInt(dynamic value) {
  return value is String ? int.parse(value) : value;
}

double parseDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else if (value is int) {
    return value.toDouble();
  }

  return value;
}

String parseString(dynamic value) {
  return value == null ? "" : value.toString();
}

bool parseBool(dynamic value) {
  return value == "true" || value == true || value == 1 || value == "1";
}

bool isEmpty(dynamic val) {
  return val == null ||
      (val is String && val.isEmpty) ||
      (val is List && val.length == 0);
}

String pluralize(int size, String singular, String plural) {
  return size == 1 ? singular : plural;
}