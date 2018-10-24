import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/mainPage.dart';

enum BtnStyle { btnLogin, btnRegister }

class LoginUi extends StatefulWidget {
  LoginUi({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginUi createState() => new _LoginUi();
}

class _LoginUi extends State<LoginUi> {
  final TextEditingController _phoneNumController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void _openMainPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => new MainPage()),
      ModalRoute.withName('/loginPage'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var phoneNum = new Container(
        child: new TextField(
            controller: _phoneNumController,
            cursorColor: Colors.black,
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "手机号",
            ),
            //显示数字键盘
            maxLines: 1,
            keyboardType: TextInputType.phone,
            //只能输入数字
            inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly,
        ]));

    var pwdInput = new Container(
        child: new TextField(
            controller: _passwordController,
            maxLines: 1,
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "密码",
            ),
            obscureText: true));

    bool _regist() {
      bool ok = false;
      print('_regist function called');
      if (_phoneNumController.text.isEmpty) {
        final snackBar = new SnackBar(content: new Text('号码不能为空！'));
        Scaffold.of(context).showSnackBar(snackBar);
        ok = false;
      } else {
        ok = true;
      }

      return ok;
    }

    bool _login() {
      bool ok = false;
      print('_login function called');
      if (_passwordController.text.isEmpty) {
        final snackBar = new SnackBar(content: new Text('密码不能为空！'));
        Scaffold.of(context).showSnackBar(snackBar);
        ok = false;
      } else {
        ok = true;
      }
      return ok;
    }

    const btnColor = Color.fromARGB(255, 255, 194, 0);

    const loginBtnTextStyle = TextStyle(color: Colors.white);

    const registBtnTextStyle = TextStyle(color: btnColor);

    Widget _createRaisedBtn(BtnStyle style) {
      return style == BtnStyle.btnLogin
          ? new Builder(builder: (BuildContext context) {
              return new RaisedButton(
                  child: Text('登录', style: loginBtnTextStyle),
                  color: btnColor,
                  onPressed: () {
                    print('_login function called');
                    if (_phoneNumController.text.isEmpty) {
                      final snackBar =
                          new SnackBar(content: new Text('号码不能为空！'));
                      Scaffold.of(context).showSnackBar(snackBar);
                      return;
                    }

                    if (_passwordController.text.isEmpty) {
                      final snackBar =
                          new SnackBar(content: new Text('密码不能为空！'));
                      Scaffold.of(context).showSnackBar(snackBar);
                      return;
                    }

                    //TODO
                    _openMainPage();
                  });

            })
          : new Builder(builder: (BuildContext context) {
              return new RaisedButton(
                  child: Text('注册', style: registBtnTextStyle),
                  color: Colors.white,
                  onPressed: () {
                    print('_regist function called');
                    if (_phoneNumController.text.isEmpty) {
                      final snackBar =
                          new SnackBar(content: new Text('号码不能为空！'));
                      Scaffold.of(context).showSnackBar(snackBar);
                      return;
                    }
                    //TODO
                    _openMainPage();
                  });
            });
    }

    Container _createBtn(BtnStyle style) {
      return new Container(
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Expanded(child: _createRaisedBtn(style)),
              ]));
    }

    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: btnColor,
            title: new Text(
              '注册',
              style: new TextStyle(color: Colors.white),
            )),
        body: new Container(
            color: Colors.white,
            child: new Builder(builder: (BuildContext context) {
              return new ListView(children: <Widget>[
                new Container(
                  color: Colors.white,
                  child: new Column(children: <Widget>[
                    new Container(
                      margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                      child: new Image.asset(
                        'images/logo.png',
                        width: 170.0,
                        height: 46.0,
                      ),
                    ),
                    new Card(
                        margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        child: new Container(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                            child: new Column(
                                children: <Widget>[phoneNum, pwdInput]))),
                    new Column(
                      children: <Widget>[
                        _createBtn(BtnStyle.btnLogin),
                        _createBtn(BtnStyle.btnRegister),
                      ],
                    )
                  ]),
                ),
              ]);
            })));
  }
}
