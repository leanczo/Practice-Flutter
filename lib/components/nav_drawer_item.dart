import '../constans/k_colors.dart';
import '../ui/employee/main_menu_screen.dart';
import '../utilities/screen_args.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class NavigationDrawerItem extends StatelessWidget {
  final BuildContext context;
  final String iconPath, title, routeName;
  final ScreenArgs args;
  final Function onButtonPressed;

  NavigationDrawerItem(
      {this.context,
        this.iconPath,
        this.title,
        this.routeName,
        this.args,
        this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(iconPath, width: 20),
              SizedBox(
                width: 30,
              ),
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, color: kWhiteTextColor),
              )
            ],
          )),
      onTap: () {
        if (onButtonPressed != null) {
          onButtonPressed();
        }
        if (routeName != null) {
          Navigator.pop(context);
          Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) {
            if (route.settings.name == '/' ||
                route.settings.name == MainMenuScreen.routeName) {
              return true;
            }
            return false;
          }, arguments: args);
        }
      },
    );
  }
}
