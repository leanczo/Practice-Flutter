import 'package:flutter/material.dart';
import 'package:hello_world/constans/k_colors.dart';
import 'package:hello_world/ui/home_screen.dart';
import '../components/nav_drawer_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF212121), Color(0xFF212121)])),
        child:
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NavigationDrawerItem(
                    context: context,
                    title: 'Devotionals',
                    iconPath: 'assets/images/icon_user.png',
                    routeName: HomeScreen.routeName,
                  ),
                  NavigationDrawerItem(
                    context: context,
                    title: 'Bookmarks',
                    iconPath: 'images/icon_user.png',
                  ),
                  NavigationDrawerItem(
                    context: context,
                    title: 'Subscriptions',
                    iconPath: 'images/icon_user.png',
                  ),
                  NavigationDrawerItem(
                    context: context,
                    title: 'Profile',
                    iconPath: 'images/icon_user.png',
                  ),
                  NavigationDrawerItem(
                    context: context,
                    title: 'Settings',
                    iconPath: 'images/icon_user.png',
                  ),
                ],
              ),
            )

      ),
    );
  }
}
