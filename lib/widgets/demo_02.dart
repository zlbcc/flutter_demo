import 'package:flutter/material.dart'; // 默认风格
// import 'package:flutter/cupertino.dart'; // ios风格

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航'),
      ),
      body: RaisedButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed('menu', arguments: '菜单')
              // .popAndPushNamed('menu')
              .then((value) => print(value));
          // 代码有返回值的时候才会走
          // Navigator.of(context)
          //     .push(MaterialPageRoute(
          //         builder: (context) {
          //           return Menu();
          //         },
          //         fullscreenDialog: false,
          //         settings: RouteSettings(
          //           name: '路由名称',
          //           arguments: {'name': '小花', 'age': 20, 'sex': 'nan'},
          //         )))
          //     .then((value) => print(value));
        },
        child: Text('登陆'),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  // final String title;

  // const Menu({Key? key, required this.title})
  //     : super(key: key); // 当用这个组件的时候 这个参数是必传的

  @override
  Widget build(BuildContext context) {
    dynamic argumentsC = ModalRoute.of(context)?.settings.name;
    print(argumentsC);
    return Scaffold(
      appBar: AppBar(
        title: Text(argumentsC),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pop('zhaolib');
              // Navigator.pop(context);
            },
            child: Text('返回'),
          ),
          Text(
            argumentsC.toString(),
            // argumentsC['name'],
            // style: TextStyle(color: Colors.red),
          )
        ],
      ),
      // body: Container(
      //   color: Colors.green,
      //   child: RaisedButton(
      //     onPressed: () {
      //       Navigator.of(context).pop('zhaolib');
      //       // Navigator.pop(context);
      //     },
      //     child: Text('返回'),
      //   ),

      // ),
    );
  }
}
