import 'package:flutter/material.dart';
import 'package:ch8_tabbar/pages/birthdays.dart';
import 'package:ch8_tabbar/pages/gratitude.dart';
import 'package:ch8_tabbar/pages/reminders.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController _tabController;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this,length: 3);
    _tabController.addListener(_tabChanged);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _tabChanged(){
    //check if tab controller index is changing, otherwise we get the notice twice
    if(_tabController.indexIsChanging){
      print('tabChanged: ${_tabController.index}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar and TabBarView'),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            Birthdays(),
            Gratitude(),
            Reminders(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.blue.shade200,
          unselectedLabelColor: Colors.black38,
          tabs: [
            Tab(
              icon:Icon(Icons.cake),
              text: 'Birthdays',
            ),
            Tab(
              icon:Icon(Icons.sentiment_satisfied),
              text: 'Gratitude',
            ),
            Tab(
              icon: Icon(Icons.access_alarm),
              text:'Reminders',
            )
          ],
        ),
      ),
    );
  }
}
