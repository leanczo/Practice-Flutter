import '../models/devotion_model.dart';

class IRepoCustomer {
  void init() {
    return null;
  }

  Future<Type> fetchData(Type generic) async {
    return null;
  }

  Future<Type> syncChangeOrder(Type generic) async {
    return null;
  }

  String getUserName() {
    return null;
  }

  Future<List<DevotionModel>> getCustomerBudgets(){
    return null;
  }
}
