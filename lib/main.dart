import 'package:flutter/material.dart';
import 'BottomNavBar/BottomNavBar.dart';
import 'NoWayBottomBar/NoWayBottomBar.dart';
import 'package:flutter_demo/widgets/demo_02.dart';
import 'package:flutter_demo/widgets/layout.dart';
import './widgets/homepage.dart';
import 'WrapDemo/wrapDemo.dart';

main(List<String> args) => runApp(Myapp());

// 入口
class Myapp extends StatelessWidget {
  @override // 重构里面的方法
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 默认读取/当首页
      // theme: ThemeData(primaryColor: Colors.yellow),
      routes: {
        '/': (context) => LoginView(),
        'layout': (context) => LayoutDemo(),
        'bottomNavBar': (context) => BottomNavBar(),
        'noWayBottomBar': (context) => NoWayBottomBar(),
        'homePage': (context) => HomePage(),
        'wrapDemo': (context) => WrapDemos()
      },
      initialRoute: 'wrapDemo',
      onGenerateRoute: (RouteSettings routerName) {
        // 如果在路由表里面注册了路由 就不会在这个里面显示
        print(routerName);
        switch (routerName.name) {
          case 'menu':
            return MaterialPageRoute(
              builder: (context) {
                return Menu();
              },
              settings: routerName,
            );
            break;
          default:
        }
      },
      // initialRoute: 'menu',
      // title: 'hellw',
      // home: HomePage(), // 基础组件 窗口主体
      // home: LoginView(), // 导航拦
    );
  }
}
