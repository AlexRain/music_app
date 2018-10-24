import 'package:flutter/material.dart';
import 'package:music_app/explorPage.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';


enum PopupMenu { setting, softwareInfo, aboutUs }

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {

  List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(title: new Text('发现'),icon: Icon(Icons.search)),
    new BottomNavigationBarItem(title: new Text('视频'),icon: Icon(Icons.videocam)),
    new BottomNavigationBarItem(title: new Text('我的'),icon: Icon(Icons.music_note)),
    new BottomNavigationBarItem(title: new Text('朋友'),icon: Icon(Icons.people)),
    new BottomNavigationBarItem(title: new Text('账号'),icon: Icon(Icons.person)),
  ];

  var _mainPages = <Widget>[
    new ExplorUi(),
    new Container(
      color: Colors.greenAccent,
    ),
    new Container(
      color: Colors.blueAccent,
    ),
    new Container(
      color: Colors.grey,
    ),
    new Container(
      color: Colors.black,
    ),
  ];

  //当前索引
  int _tabIndex = 0;
  //有检索框的appBar
  SearchBar searchBar;
  var popupMenu;


  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      leading: new IconButton(icon: Icon(Icons.keyboard_voice), onPressed: (){}),
        title: new Text('网易云音乐'),
        actions: [searchBar.getSearchAction(context),popupMenu]
    );
  }

  MainPageState(){
    searchBar = new SearchBar(
        inBar: true,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar,
    );

    popupMenu = PopupMenuButton<PopupMenu>(
        onSelected: (PopupMenu result) { setState(() {  }); },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupMenu>>[
          const PopupMenuItem<PopupMenu>(
            value: PopupMenu.setting,
            child: Text('设置'),
          ),
          const PopupMenuItem<PopupMenu>(
            value: PopupMenu.softwareInfo,
            child: Text('软件信息'),
          ),
          const PopupMenuItem<PopupMenu>(
            value: PopupMenu.aboutUs,
            child: Text('关于'),
          ),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget userHeader = new Container(
        child: new GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/personalInfo');
            },
            child: new UserAccountsDrawerHeader(
                accountName: new Text('Xiewei'),
                accountEmail: new Text('tom@xxx.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: AssetImage('images/head.png'),
                  radius: 35.0,
                ))));

    var _bottomNavigationBar = new BottomNavigationBar(
      items: _bottomTabs,
      type: BottomNavigationBarType.fixed,
      currentIndex: _tabIndex,
      onTap: (index) {
        setState(() {
          _tabIndex = index;
        });
      },
    );


    return Scaffold(
//        appBar: AppBar(actions: <Widget>[
//          new IconButton(color:Colors.white,icon: new Icon(Icons.search), onPressed: (){
//
//          }),
//          new IconButton(color:Colors.white,icon: new Icon(Icons.keyboard_voice), onPressed: (){
//
//          }),
//          popupMenu,
//        ],
//            backgroundColor:Colors.red),
    appBar: searchBar.build(context),
        body:_mainPages[_tabIndex],
        bottomNavigationBar: _bottomNavigationBar,
//        drawer: Drawer(
//            child: Container(
//          child: new ListView(
//            padding: EdgeInsets.zero,
//            children: <Widget>[
//              userHeader, // 可在这里替换自定义的header
//              ListTile(
//                title: Text('Item 1'),
//                leading: new CircleAvatar(child: new Icon(Icons.school)),
//                onTap: () {
//                  Navigator.pop(context);
//                },
//              ),
//              ListTile(
//                title: Text('Item 2'),
//                leading: new CircleAvatar(
//                  child: new Text('B2'),
//                ),
//                onTap: () {
//                  Navigator.pop(context);
//                },
//              ),
//              ListTile(
//                title: Text('Item 3'),
//                leading: new CircleAvatar(
//                  child: new Icon(Icons.list),
//                ),
//                onTap: () {
//                  Navigator.pop(context);
//                },
//              ),
//            ],
//          ),
//        ))
    );
  }
}
