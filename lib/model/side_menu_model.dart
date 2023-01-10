class SideMenuModel {
  String pageName;
  String pageNumber;
  bool isUse;
  bool hasSubMenu;
  List<SideMenuSubModel>? subItem;
  SideMenuModel(
      {required this.pageName,
      required this.pageNumber,
      required this.hasSubMenu,
      required this.isUse,
      this.subItem});
}

class SideMenuSubModel {
  String pageName;
  String pageNumber;
  bool isUse;
  SideMenuSubModel(this.pageName, this.pageNumber, this.isUse);
}
