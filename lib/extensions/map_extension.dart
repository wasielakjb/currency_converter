import 'package:currency_converter/extensions/json.dart';

extension JsonExtension on Json {
  dynamic recursiveVal(String key) {
    final keys = key.split('.');
    if (keys.any((k) => k.isEmpty)) return null;

    final headKey = keys.first;
    final value = containsKey(headKey) ? this[headKey] : null;

    final isLastKey = keys.length == 1;
    if (isLastKey) return value;

    if (value is Json) {
      final tailKey = keys.skip(1).join('.');
      return value.recursiveVal(tailKey);
    } else {
      return null;
    }
  }
}
