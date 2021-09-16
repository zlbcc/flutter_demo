import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/demo_01.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello word'),
        elevation: 10.0,
        centerTitle: true,
      ),
      // body: TexDemo(),
      // body: ButtonDemo(),
      // body: ImageDemo(),
      // body: CheckDemo(),
      // body: Progress(),
      body: InputDemo(),
    );
  }
}
