import '../models/devotion_model.dart';
import '../utilities/IRepoDevotions.dart';
import 'package:flutter/cupertino.dart';

class CustomerViewModel extends ChangeNotifier {
  final IRepoCustomer repository;

  CustomerViewModel({this.repository});

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
