import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NowTime with ChangeNotifier {
  late Timer _tmrNow;
  String dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  Future<void> tick() async {
    _tmrNow = Timer.periodic(const Duration(seconds: 1), (timer) {
      dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      notifyListeners();
    });
  }

  void disposeTick() {
    _tmrNow.cancel();
  }
}
