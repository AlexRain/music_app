import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class CommonPage extends StatefulWidget{
  @override
  State<CommonPage> createState() {
    // TODO: implement createState
    return new CommonPageState();
  }
}

class CommonPageState extends State<CommonPage> with SingleTickerProviderStateMixin{

  var _tabsItem;
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
    return Container(color: Colors.red,);
  }

}