class CastValue {
  static String toStr(dynamic value) {
    return (value as String);
  }

  static int toInteger(dynamic value, {int? defaultValue}) {
    return (value as num?)?.toInt() ?? (defaultValue ?? 0);
  }

  static double toDoubleValue(dynamic value, {double? defaultValue}) {
    return (value as num?)?.toDouble() ?? (defaultValue ?? 0.0);
  }

  static num toNumber(dynamic value, {num? defaultValue}) {
    return (value as num?) ?? (defaultValue ?? 0);
  }

  static bool toBoolean(dynamic value, {bool? defaultValue}) {
    return (value as bool?) ?? (defaultValue ?? false);
  }

  static Map<String, dynamic> toMap(dynamic value) {
    return (value as Map<String, dynamic>?) ?? <String, dynamic>{};
  }

  static List<T> toListOfObject<T>(
      {required dynamic value,
      required dynamic Function(Map<String, dynamic>) fromMap}) {
    if (value is List) {
      if (value.isEmpty) {
        return <T>[];
      }
    }

    return List<T>.from(
      (value as List<dynamic>?)?.map<dynamic>(
            (dynamic element) => fromMap(element as Map<String, dynamic>),
          ) ??
          <T>[],
    );
  }

  static DateTime? toDateTime(dynamic value) {
    return DateTime.tryParse((value as String?) ?? '');
  }
}
