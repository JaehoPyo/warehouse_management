import 'package:flutter/material.dart';

import 'package:warehouse_management/model/side_menu_model.dart';

class PageData with ChangeNotifier {
  List<SideMenuModel> list = [];

  String _currentPage = '자동화 창고 관리 프로그램';
  String get currentPage => _currentPage;

  setCurrentPage(String currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  fetchMenuList() async {
    await Future.delayed(const Duration(seconds: 2));
    list = [
      SideMenuModel(
          pageName: "main 1",
          pageNumber: "100",
          isUse: true,
          hasSubMenu: true,
          subItem: [
            SideMenuSubModel("sub 1-1", "110", true),
            SideMenuSubModel("sub 1-2", "120", true),
            SideMenuSubModel("sub 1-3", "130", true)
          ]),
      SideMenuModel(
          pageName: "main 2",
          pageNumber: "200",
          isUse: true,
          hasSubMenu: true,
          subItem: [
            SideMenuSubModel("sub 2-1", "210", true),
            SideMenuSubModel("sub 2-2", "120", true),
            SideMenuSubModel("sub 2-3", "130", true)
          ]),
      SideMenuModel(
          pageName: "main 3",
          pageNumber: "300",
          isUse: true,
          hasSubMenu: true,
          subItem: [
            SideMenuSubModel("sub 3-1", "310", true),
            SideMenuSubModel("sub 3-2", "120", true),
            SideMenuSubModel("sub 3-3", "130", true)
          ]),
      SideMenuModel(
        pageName: "main 4",
        pageNumber: "400",
        isUse: true,
        hasSubMenu: false,
      ),
      //subItem: [SideMenuSubModel("sub 4-1", "410", true), SideMenuSubModel("sub 4-2", "420", true), SideMenuSubModel("sub 4-3", "430", true)]),
      SideMenuModel(
          pageName: "main 5",
          pageNumber: "500",
          isUse: true,
          hasSubMenu: true,
          subItem: [
            SideMenuSubModel("sub 5-1", "510", true),
            SideMenuSubModel("sub 5-2", "520", true),
            SideMenuSubModel("sub 5-3", "530", true)
          ]),
    ];
  }
}
