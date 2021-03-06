import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

enum PopupMenu { setting, softwareInfo, aboutUs }

class ExplorUi extends StatefulWidget {
  ExplorUi({Key key}) : super(key: key);

  @override
  ExplorUiState createState() => new ExplorUiState();
}

class ExplorUiState extends State<ExplorUi>
    with SingleTickerProviderStateMixin {

  var  _tabsItem = <Tab>[
    new Tab(
        text: '个性推荐'),
    new Tab(text: '主播电台'),
  ];

  ///上tab页控制器
  TabController _tabCtrl;

  //有检索框的appBar
  SearchBar searchBar;
  var popupMenu;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      leading:
      new IconButton(icon: Icon(Icons.keyboard_voice), onPressed: () {
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

  ExplorUiState() {
    searchBar = new SearchBar(
      inBar: true,
      setState: setState,
      onSubmitted: print,
      buildDefaultAppBar: buildAppBar,
    );

    popupMenu = PopupMenuButton<PopupMenu>(
        onSelected: (PopupMenu result) {
          setState(() {});
        },
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
        ]);
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
          new Container(color: Colors.redAccent,),
          new Container(color: Colors.yellowAccent,)
        ],
      ),
    );
  }
}
