import 'package:flutter/material.dart';

class ExplorUi extends StatefulWidget {
  ExplorUi({Key key}) : super(key: key);

  @override
  ExplorUiState createState() => new ExplorUiState();
}

class ExplorUiState extends State<ExplorUi>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabsItem = <Tab>[
    new Tab(
        text: '个性推荐'),
    new Tab(text: '主播电台'),
  ];

  ///上tab页控制器
  TabController _tabCtrl;

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
    Container _MainPageTop = new Container(
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          new Icon(Icons.keyboard_voice),
          new TextField(
            decoration: new InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, style: BorderStyle.solid)),
              hintText: "New Soul - Vox Angle",
            ),
          ),
          new Icon(Icons.format_list_bulleted),
        ],
      ),
    );

//    return new Scaffold(
//      appBar: new AppBar(title: Text('主页')),
//      body: new Container(
//          child:new ListView(
//            children: <Widget>[
////              _MainPageTop,
//              new TabBarView(
//                controller: _tabCtrl,
//                children: _tabsItem.map((Tab tab) {
//                  return new Container(color: Colors.white, child: Text(tab.text));
//                }).toList(),
//              ),
//            ],
//          )
//      ),
//    );

    return new Scaffold(
      appBar: new AppBar(
        bottom: new TabBar(
          controller: _tabCtrl,
          isScrollable: true,
          tabs: _tabsItem.map((Tab tab) {
            return new Tab(text: tab.text);
          }).toList(),
        ),
      ),
      body: new TabBarView(
        controller: _tabCtrl,
        children: <Widget>[
          new ListView(
            children: <Widget>[
              new Container(color: Colors.redAccent,),
              new Container(color: Colors.yellowAccent,)
            ],
          ),
          new Container(color: Colors.white,)
        ],
      ),
    );
  }
}
