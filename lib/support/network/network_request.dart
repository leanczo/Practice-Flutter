import 'package:flutter/cupertino.dart';

import 'http_method_enum.dart';

class NetworkRequest {
  String url;
  HttpMethodEnum httpMethod;
  bool enableCache;
  bool forceUpdate;
  bool enableRepeat;
  bool throwExceptions;
  int cacheDurationInMinutes;
  int connectionTimeout;
  String mediaType;
  String jsonBody;

  NetworkRequest({
    @required this.url,
    @required this.httpMethod,
    this.enableCache = false,
    this.forceUpdate = false,
    this.enableRepeat = false,
    this.throwExceptions = true,
    this.cacheDurationInMinutes = 1440,
    this.connectionTimeout,
    this.mediaType = "application/json;",
    this.jsonBody,
  });
}