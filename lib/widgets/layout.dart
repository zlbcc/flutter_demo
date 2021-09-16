import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局'),
      ),
      // body: RowColumu(),
      // body: FlexDemo(),
      // body: WrapDemo(),
      // body: StackDemo(),
      // body: AlignDemo(),
      // body: MarginDemo(),
      // body: ConstraineBoxDemp(),
      body: ContainerDemo(),
    );
  }
}

// Row Column
class RowColumu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.grey,
        child: Row(
          // mainAxisSize: MainAxisSize.min, //默认方向填充
          textDirection: TextDirection.rtl, // 方向
          mainAxisAlignment: MainAxisAlignment.spaceAround, // 元素对齐方式
          crossAxisAlignment: CrossAxisAlignment.center, // 纵轴
          children: [
            Container(
              color: Colors.red,
              width: 100.0,
              height: 100.0,
            ),
            Container(
              color: Colors.green,
              width: 150.0,
              height: 150.0,
            ),
            Container(
              color: Colors.yellow,
              width: 100.0,
              height: 100.0,
            )
          ],
        ),
      ),
    );
  }
}

// Flex
class FlexDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
              width: 100.0,
              height: 100.0,
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              width: 100.0,
              height: 100.0,
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
              width: 100.0,
              height: 100.0,
            ),
            flex: 1,
          ),
          // Container(
          //   color: Colors.green,
          //   width: 150.0,
          //   height: 150.0,
          // ),
          // Container(
          //   color: Colors.yellow,
          //   width: 100.0,
          //   height: 100.0,
          // )
        ],
      ),
    );
  }
}

// Wrap 流失布局
class WrapDemo extends StatefulWidget {
  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  List<int> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 20; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      direction: Axis.vertical,
      alignment: WrapAlignment.end,
      children: list
          .map((e) => Container(
                width: 100,
                height: 100,
                child: Text(e.toString()),
                color: Colors.lightBlue,
              ))
          .toList(),
    );
  }
}

// Stack 层叠布局
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      margin: EdgeInsets.all(50),
      color: Colors.grey,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          Container(
            width: 80,
            height: 80,
            color: Colors.pink,
          ),
          Positioned(
            // width: 20,
            // height: 20,
            top: 10.0,
            bottom: 10.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}

// Align 相对定位
class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      width: 200,
      height: 200,
      color: Colors.red,
      child: Align(
        alignment: Alignment(1, 0),
        // widthFactor: 2.0,
        // heightFactor: 2.0,
        child: FlutterLogo(
          size: 50,
        ),
      ),
    );
  }
}

// Margin Padding
class MarginDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      // height: 100,
      color: Colors.red,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // padding: EdgeInsets.fromWindowPadding('left', 10, right, 10),
      child: Text(
        'hello word',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}

//ConstrainedBox
class ConstraineBoxDemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ConstrainedBox(
    //   constraints: BoxConstraints(
    //     maxHeight: 100,
    //     maxWidth: 100,
    //     minWidth: 50,
    //     minHeight: 50,
    //   ),
    //   child: Container(
    //     // width: 10,
    //     // height: 500,
    //     color: Colors.red,
    //   ),
    // );
    return SizedBox(
      width: 100,
      height: 100,
      child: Container(
        color: Colors.red,
        width: 10,
        height: 20,
      ),
    );
  }
}

// DecoratedBox
class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(
          colors: [Colors.red, Colors.blue],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(2.0, 2.0),
            blurRadius: 8,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
        child: Text(
          'log',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// Container
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.all(150),
      child: Text('hello'),
      decoration: BoxDecoration(
        color: Colors.red,
        // backgroundBlendMode: null,
      ),
      // transform: Matrix4.rotationZ(.5),
    );
  }
}
