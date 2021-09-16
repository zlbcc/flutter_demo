import 'package:flutter/material.dart';
import 'package:flutter_demo/EachView/eachView.dart';

class NoWayBottomBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return EachView('new page');
          }));
        },
        tooltip: 'hello', // 提示
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endDocked, // 按钮的位置
      bottomNavigationBar: BottomAppBar(
        // 底部工具栏相比较底部导航灵活
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(), // 为了和上面的融合起来的缺口
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.exit_to_app),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
