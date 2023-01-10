import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse_management/model/side_menu_model.dart';

import 'components/main_app_bar.dart';
import 'provider/page_data.dart';

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
        ChangeNotifierProvider<PageData>(
          create: (context) => PageData(),
        ),
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
        const Expanded(
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
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: Provider.of<PageData>(context).fetchMenuList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError == true) {
          return Center(child: Text(snapshot.error.toString()));
        }

        return Consumer<PageData>(
          builder: (context, value, child) => ListView.builder(
              itemCount: value.list.length,
              itemBuilder: (context, index) {
                return SideMenuItem(item: value.list[index]);
              }),
        );
      },
    );
  }
}

class SideMenuItem extends StatefulWidget {
  final SideMenuModel item;
  const SideMenuItem({super.key, required this.item});

  @override
  State<SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  bool isOpen = false;

  _toggleOpen() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  _buildTrailing() {
    if (widget.item.hasSubMenu == false) {
      return null;
    }

    return isOpen
        ? const Icon(Icons.arrow_drop_up)
        : const Icon(Icons.arrow_drop_down);
  }

  List<Widget> _buildItem() {
    List<Widget> list = [];
    list.add(ListTile(
      title: Text(widget.item.pageName),
      trailing: _buildTrailing(),
      onTap: _toggleOpen,
    ));
    if (widget.item.subItem == null) {
      return list;
    }

    if (isOpen) {
      for (int i = 0; i < widget.item.subItem!.length; i++) {
        list.add(ListTile(title: Text(widget.item.subItem![i].pageName)));
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildItem(),
    );
  }
}
