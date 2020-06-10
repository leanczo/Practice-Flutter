import '../models/devotion_model.dart';
import '../utilities/IRepoDevotions.dart';
import 'package:flutter/cupertino.dart';

class DevotionsViewModel extends ChangeNotifier {
  final IRepoCustomer repository;

  DevotionsViewModel({this.repository});

  String userName;

  init() {
    repository.init();
    userName = repository.getUserName();
  }

  Future<List<DevotionModel>> getDevotions() async {
    try{
      return await repository.getCustomerBudgets();
    }
    catch (e){
      print(e.toString());
      return [];
    }
  }
}
