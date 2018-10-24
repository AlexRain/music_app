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
  final bool _bSession = false;

  //检测用户是否已经登录
  Widget _createHomePage() {
    if (_bSession)
      return new MainPage();
    else
      return new LoginUi();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
//        brightness: Brightness.dark,
      ),
      home: _createHomePage(),
      routes: <String, WidgetBuilder>{
        '/mainPage': (BuildContext context) => new MainPage(title: '主界面'),
        '/loginPage': (BuildContext context) => new LoginUi(title: '登录和注册界面'),
        '/personalInfo': (BuildContext context) => new PersonalInfo(),
      },
    );
  }
}
