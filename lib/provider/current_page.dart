import 'package:flutter/material.dart';

class CurrentPage with ChangeNotifier {
  String _currentPage = '자동화 창고 관리 프로그램';
  String get currentPage => _currentPage;

  setCurrentPage(String currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
