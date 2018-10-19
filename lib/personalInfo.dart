import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PersonalInfo extends StatefulWidget {
  PersonalInfo({Key key}) : super(key: key);

  @override
  PersonalInfoState createState() {
    return new PersonalInfoState();
  }
}

class PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController _nickNameCtrl = new TextEditingController();
  String _userHeadPath = 'images/head.png';

  void _updateUserHead(String path) {
    setState(() {
      _userHeadPath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text('完善个人信息')),
      body: new Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              child: new Stack(
                children: <Widget>[
                  new CircleAvatar(
                    child: new Image.asset(_userHeadPath),
                    backgroundColor: Colors.lightBlueAccent,
                    radius: 50.0,
                  ),
                  new Opacity(
                    opacity: 0.3, //不透明度
                    child: new CircleAvatar(
                      child: new IconButton(
                          icon: new Icon(Icons.camera_alt),
                          onPressed: () async {
                            File imageFile = await ImagePicker.pickImage(
                                source: ImageSource.camera);
                            if (imageFile.path.isNotEmpty)
                              _updateUserHead(imageFile.path);
                          }),
                      backgroundColor: Colors.black,
                      radius: 50.0,
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 20.0),
            ),
            new TextField(
              controller: _nickNameCtrl,
              decoration: new InputDecoration(
                border: InputBorder.none,
                hintText: "昵称",
              ),
            ),
            new TextField(
              decoration: new InputDecoration(
                border: InputBorder.none,
                hintText: "签名",
              ),
            ),
            new Builder(builder: (BuildContext context) {
              return new RaisedButton(
                  onPressed: () {
                    print('_login function called');
                    if (_nickNameCtrl.text.isEmpty) {
                      final snackBar =
                          new SnackBar(content: new Text('昵称不能为空！'));
                      Scaffold.of(context).showSnackBar(snackBar);
                      return;
                    }
                    //TODO
                    Navigator.of(context).pushNamed('/mainPage');
                  },
                  child: Text('完成',
                      style: new TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.blue);
            })
          ],
        ),
      ),
    );
  }
}
