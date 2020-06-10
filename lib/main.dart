import 'package:flutter/material.dart';
import 'package:hello_world/models/devotion_model.dart';
import 'package:hello_world/services/repository_devotions.dart';
import 'package:hello_world/viewmodels/devotions_view_model.dart';
import 'ui/nav_drawer.dart';
import 'ui/home_screen.dart';
import 'ui/bookmarks_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final devotionViewModel = DevotionsViewModel(
    repository: RepositoryDevotions(
      prefs: await SharedPreferences.getInstance(),
    ),
  );

  devotionViewModel.init();
   runApp(MyApp());
}

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
        BookmarksScreen.routeName : (context) => BookmarksScreen(title: "Bookmarks"),
      }
    );
}
}


