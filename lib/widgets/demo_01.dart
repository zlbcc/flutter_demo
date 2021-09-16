import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // 谷歌自己定义的不倒入的话无法用这些组件

/* 
  1. 文本
  2. 按钮
  3. 图片
  4. 开关/复选框
  5. 进度指示器
  6. 点击事件
 */

// 文本
class TexDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   //布局组件
    //   child: Text(
    //     'wenben',
    //     maxLines: 1,
    //     overflow: TextOverflow.ellipsis,
    //   ),
    // );
    return Container(
      width: double.infinity,
      color: Colors.green,
      child: Text(
        // widget
        '文本',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red,
            decoration: TextDecoration.underline,
            fontSize: 25.0),
      ),
    );
  }
}

// 按钮
class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          // 凸起按钮
          onPressed: () {},
          child: Text('漂浮'),
        ),
        FlatButton(onPressed: () {}, child: Text('扁平按钮')),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('icon'),
          color: Colors.red,
          textColor: Colors.green,
        ),
        OutlineButton(
          onPressed: () {},
          color: Colors.red,
          child: Text('边框', style: TextStyle(color: Colors.green)),
        ),
        OutlineButton.icon(
          onPressed: () {
            print(123);
          },
          icon: Icon(Icons.add),
          label: Text('icon'),
          color: Colors.red,
        ),
        IconButton(
            icon: Icon(Icons.update),
            color: Colors.red,
            iconSize: 18,
            onPressed: () {})
      ],
    );
  }
}

// 图片
class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.add),
        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        Container(
          width: double.infinity,
          child: Image.network(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201207%2F22%2F20120722075151_s88n2.jpeg&refer=http%3A%2F%2Fcdn.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1630319713&t=b99a0c1d598ef3bbcd9924f42ee347c0",
            // fit: BoxFit.fitHeight,
          ),
        ),
        // Image.file(file),
        // Image.asset('images/image.jpeg')
      ],
      // child: Text('hhh'),
    );
  }
}

// 开关/复选框
class CheckDemo extends StatefulWidget {
  @override
  _CheckDemoState createState() => _CheckDemoState();
}

class _CheckDemoState extends State<CheckDemo> {
  bool _check = true;
  bool _switch = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('data'),
        Checkbox(
            value: _check,
            onChanged: (v) {
              setState(() {
                _check = v as bool;
              });
            }),
        Switch(
            value: _switch,
            onChanged: (v) {
              setState(() {
                _switch = v;
              });
            })
      ],
    );
  }
}

// 进度指示器
class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: .5, // 0-1
            valueColor: AlwaysStoppedAnimation(Colors.red), // 颜色
          ),
          SizedBox(
            // 间距容器
            height: 20,
          ),
          CircularProgressIndicator(
            // value: ,
            valueColor: AlwaysStoppedAnimation(Colors.pink),
          ), // 类似一个loading效果
          SizedBox(
            // 间距容器
            height: 50,
          ),
          CupertinoActivityIndicator(),
        ],
      ),
    );
  }
}

//点击事件
class ClickDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [

    //   ],
    // );
    return GestureDetector(
      onTap: () {
        print('单击');
      },
      onDoubleTap: () {
        print('双击');
      },
      child: Text('data'),
    );
  }
}

// 输入框
class InputDemo extends StatefulWidget {
  @override
  _InputDemoState createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  GlobalKey _key = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  FocusNode _u = FocusNode();
  FocusScopeNode _p = FocusScopeNode();

  // 焦点操作
  FocusNode _focusScopeNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _user.dispose(); // 否则占用内存 导致内存溢出
    _pass.dispose(); // 否则占用内存 导致内存溢出
    _u.dispose(); // 否则占用内存 导致内存溢出
    _p.dispose(); // 否则占用内存 导致内存溢出
    if (_focusScopeNode != null) {
      _focusScopeNode.dispose(); // 如果null对象点击关闭的话 页面会崩
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      // autovalidate: true, // 默认开启自动校验
      child: Column(
        children: [
          TextFormField(
            autofocus: true, // 自动获取焦点
            focusNode: _u, // 焦点绑定
            controller: _user,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.home),
                hintText: '请输入账号',
                labelText: '账号'),
            validator: (v) {
              if (v == null || v.isEmpty) {
                return '请输入账号！';
              }
            },
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              print(312);
            },
          ),
          TextFormField(
            controller: _pass,
            focusNode: _p,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.home),
                hintText: '请输入密码',
                labelText: '密码'),
            validator: (v) {
              if (v == null || v.isEmpty) {
                return '请输入秘密啊！';
              }
            },
            textInputAction: TextInputAction.send, // 输入类型 按回车
            obscureText: true,
          ),
          RaisedButton(
            onPressed: () {
              if (_focusScopeNode == null) {
                _focusScopeNode = FocusScope.of(context); // 赋值
              }
              // _focusScopeNode.requestFocus(_u); // 请求
              _focusScopeNode.unfocus();
              // print(231);
              // if((_key.currentState as FormState).validate())
              // print((_key.currentState as FormState).validate());
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('submit'),
          )
        ],
      ),
    );
  }
}
