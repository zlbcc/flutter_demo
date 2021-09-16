import 'dart:html';

import 'package:flutter/material.dart';

class DioDemo extends StatefulWidget {
  @override
  _DioDemoState createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('标题'),
      ),
    );
  }
}
