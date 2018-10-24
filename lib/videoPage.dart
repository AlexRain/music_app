import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class VideoUi extends StatefulWidget{

  @override
  VideoUiState createState() => new VideoUiState();
}

class VideoUiState extends State<VideoUi>
  with SingleTickerProviderStateMixin{

  var  _tabsItem = <Tab>[
    new Tab(text: '推荐'),
    new Tab(text: 'LOOK直播'),
    new Tab(text: '现场'),
    new Tab(text: '农夫渔夫'),
    new Tab(text: '听BGM'),
    new Tab(text: 'MV'),
    new Tab(text: 'ACG音乐'),
    new Tab(text: '演奏'),
    new Tab(text: '广场'),
  ];

  ///上tab页控制器
  TabController _tabCtrl;

  //有检索框的appBar
  SearchBar searchBar;
  var popupMenu;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      leading:
      new IconButton(icon: Icon(Icons.videocam), onPressed: () {
        //TODO
      }),
      title: new Text('网易云音乐'),
      actions: [
        searchBar.getSearchAction(context),
        new IconButton(icon: new Icon(Icons.music_note), onPressed: (){
          //TODO
        })
      ],
      bottom: buildTabBar(),
    );
  }

  TabBar buildTabBar() {
    return new TabBar(
      controller: _tabCtrl,
      isScrollable: true,
      tabs: _tabsItem.map((Tab tab) {
        return new Tab(text: tab.text);
      }).toList(),
    );
  }

  VideoUiState() {
    searchBar = new SearchBar(
      inBar: true,
      setState: setState,
      onSubmitted: print,
      buildDefaultAppBar: buildAppBar,
    );
  }

  @override
  void initState() {
    super.initState();
    _tabCtrl = new TabController(length: _tabsItem.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      body: new TabBarView(
        controller: _tabCtrl,
        children: <Widget>[
          new Container(color: Colors.greenAccent,),
          new Container(color: Colors.yellowAccent,),
          new Container(color: Colors.lightBlueAccent,),
          new Container(color: Colors.deepOrangeAccent,),
          new Container(color: Colors.pinkAccent,),
          new Container(color: Colors.yellowAccent,),
          new Container(color: Colors.yellowAccent,),
          new Container(color: Colors.yellowAccent,),
          new Container(color: Colors.yellowAccent,),
        ],
      ),
    );
  }
}