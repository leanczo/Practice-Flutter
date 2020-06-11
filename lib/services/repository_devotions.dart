import 'dart:convert';

import 'package:hello_world/constans/k_values.dart';
import 'package:hello_world/models/devotion_model.dart';
import 'package:hello_world/support/network/http_method_enum.dart';
import 'package:hello_world/support/network/network.dart';
import 'package:hello_world/support/network/network_request.dart';
import 'package:hello_world/support/network/network_response.dart';
import 'package:hello_world/utilities/IRepoDevotions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryDevotions implements IRepoDevotions {
  SharedPreferences prefs;

  RepositoryDevotions({this.prefs});
  final baseUrl = kApiUrl;

  @override
  String getUserName() {
    return prefs.getString(k_NAME);
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  Future<bool> syncBudget(DevotionModel budget) async {
    // TODO: implement syncChangeOrder
    return true;
  }

  @override
  Future<List<DevotionModel>> getCustomerBudgets() async {
    String endpoint = "todos";
    NetworkRequest request = NetworkRequest(
        url: baseUrl + endpoint,
        enableCache: false,
        httpMethod: HttpMethodEnum.httpGet);
    NetworkResponse response = await Network().callApi(request);
    Map<String, dynamic> jsonMapped = jsonDecode(response.response);

    List<DevotionModel> budgets = List<DevotionModel>.from(
        jsonMapped["records"].map((x) => DevotionModel.fromMap(x)));

    return budgets;
  }


}