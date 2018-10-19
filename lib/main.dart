import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:music_app/login.dart';

import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:music_app/mainPage.dart';
import 'package:music_app/personalInfo.dart';

void main() {
//  debugPaintSizeEnabled= true;

  runApp(new MainApp());
  //设置沉浸式样式
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.

  bool _bSession = false;

  @override
  Widget build(BuildContext context) {
    //检测用户是否已经登录
    Widget _createHomePage() {
      if (_bSession)
        return new MainPage(title: '主界面');
      else
        return new LoginUi(title: '登录和注册界面');
    }

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.

        brightness: Brightness.light,
      ),
//      home: _createHomePage(),
      home: new LoginUi(),
      routes: <String, WidgetBuilder>{
        '/mainPage': (BuildContext context) => new MainPage(title: '主界面'),
        '/loginPage': (BuildContext context) => new LoginUi(title: '登录和注册界面'),
        '/personalInfo': (BuildContext context) => new PersonalInfo(),
      },
    );
  }
}
