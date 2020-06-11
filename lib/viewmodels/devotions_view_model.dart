import '../models/devotion_model.dart';
import '../utilities/IRepoDevotions.dart';
import 'package:flutter/cupertino.dart';

class DevotionsViewModel extends ChangeNotifier {
  final IRepoDevotions repository;

  DevotionsViewModel({this.repository});

  String userName;

  init() {
    repository.init();
  }

  Future<List<DevotionModel>> getDevotions() async {
    try{
      return new List<DevotionModel>();
    }
    catch (e){
      print(e.toString());
      return [];
    }
  }
}
