import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/components/devotion_list.dart';
import 'package:hello_world/viewmodels/devotions_view_model.dart';
import 'package:hello_world/models/devotion_model.dart';
import '../ui/nav_drawer.dart';
import 'package:hello_world/constans/k_strings.dart';
import 'package:hello_world/constans/k_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../ui/app_bar.dart';
import 'package:animator/animator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  static const routeName = '/';
  final String title;
  final _child = FlutterLogo(size: 50,);

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DevotionsViewModel viewModel;
  List<DevotionModel> _projectList;
  Future<List<DevotionModel>> _devotionList;
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
              Animator(
                tween:Tween<double>(begin:0,end: 2*pi),
                duration: Duration(seconds: 2),
                repeats: 600,
                builder: (context, anim, _) => Transform(
                  transform: Matrix4.rotationY(anim.value),
                  alignment: Alignment.center,
                  child: FlutterLogo(
                    size:50,
                  ),
                ),
              )
              // _asyncCustomerProjects(),
            ],
          ),
        ),
      ),
    );
  }

  _asyncCustomerProjects() {
    return FutureBuilder<List<DevotionModel>>(
      future: viewModel.getDevotions(),
      builder: (context, snapshot) {
        _projectList = snapshot.data;
        if (snapshot.hasData &&
            _projectList != null &&
            _projectList.length != 0) {
          return _projectListView(_projectList);
        } else if (snapshot.hasError) {
          return Center(child: Text(kGeneralErrorMessage));
        } else if (_projectList != null && _projectList.length == 0) {
          return Center(child: Text(kCustomerHomeScreenEmptyProjectList));
        }
        return Center(
            child: SpinKitThreeBounce(
              color: kPrimaryColor,
              size: 40.0,
            ));
      },
    );
  }

  openNavigationDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  _projectListView(List<DevotionModel> devotions) {
    return DevotionList(budget: devotions, onItemTap: onBudgetTap);
  }

  onBudgetTap(DevotionModel budget) {
    print(budget.title);
  }
}