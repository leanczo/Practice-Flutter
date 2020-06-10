import 'dart:io';
import '../../support/cache/cache.dart';
import '../../support/cache/cache_response.dart';
import 'http_method_enum.dart';
import 'network_request.dart';
import 'network_response.dart';
import 'package:http/http.dart' as http;

class Network {
  static final Network _singleton = new Network._internal();
  static final maxConnectionAttempts = 3;
  String token;

  factory Network() {
    return _singleton;
  }

  Network._internal();

  setToken(String token) {
    this.token = token;
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<NetworkResponse> callApi(NetworkRequest request) async {
    NetworkResponse result = new NetworkResponse();

    if (request.enableCache &&
        !request.forceUpdate &&
        request.httpMethod == HttpMethodEnum.httpGet) {
      try {
        CacheResponse cache = await Cache()
            .callCache(request.url, request.cacheDurationInMinutes);

        if (cache != null && cache.isValid) {
          return new NetworkResponse(
            response: cache.response,
            statusCode: cache.statusCode,
            message: cache.response,
          );
        }
      } catch (e) {}
    }

    try {
      bool internetConnection = await checkInternetConnection();
      if (internetConnection) {
        http.Response response;

        for (int attempt = 0;
        attempt <
            ((request.httpMethod == HttpMethodEnum.httpGet &&
                request.enableRepeat)
                ? maxConnectionAttempts
                : 1);
        attempt++) {
          switch (request.httpMethod) {
            case HttpMethodEnum.httpGet:
              response = await http.get(
                request.url,
                headers: {
                  "authorization": 'Bearer $token',
                  //HttpHeaders.authorizationHeader: 'Bearer ${prefs.getString(_TOKEN)}',
                  //HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
                },
              );
              break;
            case HttpMethodEnum.httpPost:
              response = await http.post(request.url,
                  headers: {
                    "authorization": 'Bearer $token',
                    "content-type": '${request.mediaType} charset=utf-8'
                    //HttpHeaders.authorizationHeader: 'Bearer ${prefs.getString(_TOKEN)}',
                    //HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
                  },
                  body: request.jsonBody);
              break;
            case HttpMethodEnum.httpPut:
              response = await http.put(request.url,
                  headers: {
                    "authorization": 'Bearer $token',
                    "content-type": '${request.mediaType} charset=utf-8'
                    //HttpHeaders.authorizationHeader: 'Bearer ${prefs.getString(_TOKEN)}',
                    //HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
                  },
                  body: request.jsonBody);
              break;
            case HttpMethodEnum.httpDelete:
              response = await http.delete(
                request.url,
                headers: {
                  "authorization": 'Bearer $token',
                  "content-type": '${request.mediaType} charset=utf-8'
                  //HttpHeaders.authorizationHeader: 'Bearer ${prefs.getString(_TOKEN)}',
                  //HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
                },
              );
              break;
          }
          if (response.statusCode == 200) {
            break;
          }
        }

        if (response.statusCode == 200 && response.body.isNotEmpty) {
          result.response = response.body;
          result.statusCode = response.statusCode;
          result.message = response.reasonPhrase;
          if (request.enableCache &&
              request.httpMethod == HttpMethodEnum.httpGet) {
            await Cache().insertInCache(request.url, result);
          }
        } else {
          throw Exception(result.message);
        }
      } else {
        throw Exception("No internet connection available");
      }
      return result;
    } catch (e) {
      throw e;
    }
  }
}
