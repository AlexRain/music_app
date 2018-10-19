import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{

  MainPage({Key key,this.title}) : super(key: key);

  final String title;

  @override
  MainPageState createState() => new MainPageState();

}

class MainPageState extends State<MainPage>{

  @override
  Widget build(BuildContext context) {
    Widget userHeader = new GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/personalInfo');
      },
      child: new UserAccountsDrawerHeader(
      accountName: new Text('Tom'),
      accountEmail: new Text('tom@xxx.com'),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: AssetImage('images/head.png'), radius: 35.0,),));

    return Scaffold(appBar: AppBar(title: Text("Home"),),
      body: new Center(child: new Text('Home page'),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            userHeader , // 可在这里替换自定义的header
            ListTile(title: Text('Item 1'),
              leading: new CircleAvatar(child: new Icon(Icons.school),),
              onTap: () {
                Navigator.pop(context);
              },),
            ListTile(title: Text('Item 2'),
              leading: new CircleAvatar(child: new Text('B2'),),
              onTap: () {
                Navigator.pop(context);
              },),
            ListTile(title: Text('Item 3'),
              leading: new CircleAvatar(
                child: new Icon(Icons.list),),
              onTap: () {
                Navigator.pop(context);
              },),
          ],
        ),
      ),);

  }

}