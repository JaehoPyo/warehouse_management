import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:warehouse_management/provider/page_data.dart';

class MainAppBar extends StatefulWidget with PreferredSizeWidget {
  MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        70,
      );
}

class _MainAppBarState extends State<MainAppBar> {
  late Timer _tmrNow;
  DateTime now = DateTime.now();
  String _dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _tmrNow = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      });
    });
  }

  @override
  void dispose() {
    _tmrNow.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: widget.preferredSize.width,
        height: widget.preferredSize.height,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: Colors.white,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Expanded(
              flex: 4,
              child: Consumer<PageData>(
                builder: (context, value, child) => FittedBox(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //color: Colors.orange,
                    child: Text(value.currentPage),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Chip(
                    avatar: const Icon(Icons.access_time),
                    label: Text(_dateTime),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
