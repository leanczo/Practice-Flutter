
import '../../support/cache/cache_response.dart';
import '../../support/network/network_response.dart';

class Cache {
  static final Cache _singleton = new Cache._internal();
  static final maxConnectionAttempts = 3;
  String token;

  factory Cache() {
    return _singleton;
  }

  Cache._internal();

  Future<CacheResponse> callCache(
      String url, int cacheValidIntervalTimeInMinutes) async {
    String newUrl = url; //.replaceAll("https://", "");
  //  var result = await DBProvider.db.getCacheRecord(newUrl);
   // if (result == null || result.length == 0) {
   //   return null;
   // }

    //CacheResponse cacheResult = result.first;
    //Set stamp to final valid datetime
    //var time = cacheResult.stamp
    //   .add(Duration(minutes: cacheValidIntervalTimeInMinutes));

    var currentTime = DateTime.now().toUtc();

    //int isValidNumeric = currentTime.compareTo(time);

    //cacheResult.isValid = (isValidNumeric <= 0);
    //return cacheResult;
  }

  insertInCache(String url, NetworkResponse networkResponse) async {
    String newUrl = url; //.replaceAll("https://", "");
    CacheResponse cacheResponse = CacheResponse(
      url: newUrl,
      response: networkResponse.response,
      statusCode: networkResponse.statusCode,
      message: networkResponse.message,
      stamp: DateTime.now().toUtc(),
    );
    //await DBProvider.db.insertInCache(cacheResponse);
  }
}
