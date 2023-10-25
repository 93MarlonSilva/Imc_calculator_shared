import 'dart:async';
import 'package:intl/intl.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CommonController {
  final _dateTime = RxNotifier<String>('');
  String get getDateTime => _dateTime.value;
  set setDateTime(String parValue) => _dateTime.value = parValue;

  void showTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setDateTime = DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now()).replaceAll('-', '/');
    });
  }
}
