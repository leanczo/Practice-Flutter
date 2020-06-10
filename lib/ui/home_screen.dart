import 'package:flutter/material.dart';

class CustomerHomeScreen extends StatefulWidget {
  CustomerHomeScreen({Key key, this.title}) : super(key: key);
  static const routeName = '/customerHome';
  final String title;

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomerNavDrawer(),
      appBar: CustomAppBar(
        widget.title,
        false,
        onLeadingPressed: () => openNavigationDrawer(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25, top: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _mainScreenTitle(user),
              SizedBox(height: 15),
              _asyncCustomerProjects(),
            ],
          ),
        ),
      ),
    );
  }

  openNavigationDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }