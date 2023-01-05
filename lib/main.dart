import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse_management/model/side_menu_model.dart';
import 'package:warehouse_management/provider/current_page.dart';

import 'components/main_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentPage>(
          create: (context) => CurrentPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainLayout(),
      ),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Row(children: [
        Expanded(
          flex: 1,
          child: SideMenu(),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.green,
          ),
        ),
      ]),
    );
  }
}

class SideMenu extends StatelessWidget {
  SideMenu({super.key});

  final List<SideMenuModel> menuList = [
    SideMenuModel(
        mainItem: "main 1",
        subItem: ["sub 1-1", "sub 1-2", "sub 1-3", "sub 1-4"]),
    SideMenuModel(
        mainItem: "main 2",
        subItem: ["sub 2-1", "sub 2-2", "sub 2-3", "sub 2-4"]),
    SideMenuModel(
        mainItem: "main 3",
        subItem: ["sub 3-1", "sub 3-2", "sub 3-3", "sub 3-4"]),
    SideMenuModel(
        mainItem: "main 4",
        subItem: ["sub 4-1", "sub 4-2", "sub 4-3", "sub 4-4"]),
    SideMenuModel(
        mainItem: "main 5",
        subItem: ["sub 5-1", "sub 5-2", "sub 5-3", "sub 5-4"]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return Text(menuList[index].mainItem);
        });
  }
}
