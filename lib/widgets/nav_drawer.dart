import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
      new Container(
        alignment: Alignment.center,
 decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFFFFFFF),Color(0xFFFFFFFF)])),
    child:
      
       ListView(

        padding:  const EdgeInsets.only(top: 60, bottom: 15),
        children: <Widget>[
          
          ListTile(
            
            title: Text('Assessments', textAlign: TextAlign.center,),
            onTap: () => {},
          ),
          ListTile(
            title: Text('Work in Progress', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Locations', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('History', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Notifications', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Logout', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
      ),
    );
  }
}