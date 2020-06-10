import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui/nav_drawer.dart';
import '../ui/app_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  static const routeName = '/';
  final String title;

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      appBar: CustomAppBar(
        widget.title,
        false,
        onLeadingPressed: () => openNavigationDrawer(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25, top: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // _mainScreenTitle(user),
              Text('Home'),
              // _asyncCustomerProjects(),
            ],
          ),
        ),
      ),
    );
  }

  openNavigationDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }
}