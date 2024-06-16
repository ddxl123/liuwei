class Tool {}

extension DateTimeRemoveMillExt on DateTime {
  String get removeMill => "$year-$month-$day ${hour > 9 ? hour : "0$hour"}:${minute > 9 ? minute : "0:$minute"}:${second > 9 ? second : "0$second"}";
}
