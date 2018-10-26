import 'package:flutter/material.dart';
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
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
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
                    child: (_image == null)
                        ? new Image.asset('images/head.png')
                        : new Image.file(_image),
                    backgroundColor: Colors.lightBlueAccent,
                    radius: 50.0,
                  ),
                  new Opacity(
                    opacity: 0.3, //不透明度
                    child: new CircleAvatar(
                      child: new IconButton(
                          icon: new Icon(Icons.camera_alt),
                          onPressed: () {
                            showModalBottomSheet<Null>(
                                context: context,
                                builder: (BuildContext context) {
                                  return new Container(
                                    height: 144.0,
                                      child: new Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: new Column(
                                            children: <Widget>[
                                              new Container(
                                          margin:const EdgeInsets.fromLTRB(0.0,20.0,0.0,20.0),
                                                child: new GestureDetector(onTap: (){}, child: new Text('拍摄')),
                                              ),
                                              Divider(),
                                              new Container(
                                                margin:const EdgeInsets.fromLTRB(0.0,20.0,0.0,20.0),
                                                child: new GestureDetector(onTap: (){}, child: new Text('从手机相册选择')),
                                              ),
                                              Divider(),
                                            ],
                                          )
                                      )
                                  );
                                });
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
