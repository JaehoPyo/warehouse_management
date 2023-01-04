import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainLayout(),
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
      appBar: const MainAppBar(),
      body: Container(),
    );
  }
}

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        70,
      );
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: preferredSize.width,
        height: preferredSize.height,
        color: Colors.blue,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white,
            child: Image.asset('assets/images/logo.png'),
          ),
          Text("Main Menu"),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.blueAccent,
            ),
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: const [
                Icon(Icons.access_time),
                Text("12:00:00.00"),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
