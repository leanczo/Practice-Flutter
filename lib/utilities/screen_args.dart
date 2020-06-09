import '../enums/from_page.dart';
import '../models/action_model.dart';

class ScreenArgs {
  FromPage fromPage;
  ActionModel action;
  int itemId;

  ScreenArgs({this.fromPage, this.action, this.itemId});
}
