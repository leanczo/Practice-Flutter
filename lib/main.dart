import 'package:flutter/material.dart';
import 'ui/nav_drawer.dart';
import 'ui/home_screen.dart';

void main() => runApp(MyApp());

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [routeObserver],
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes : {
        HomeScreen.routeName : (context) => HomeScreen(title: "Home"),
      }
    );
}
}


