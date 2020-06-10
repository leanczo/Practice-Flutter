class CacheResponse{
  String url;
  String response;
  int statusCode;
  String message;
  DateTime stamp;
  bool isValid;

  CacheResponse(
      {this.url,
        this.response,
        this.statusCode,
        this.message,
        this.stamp});


  Map<String, dynamic> toDB() => {
    "url": url,
    "response": response,
    "statusCode": statusCode,
    "message": message,
    "stamp": stamp.toIso8601String(),
  };

  factory CacheResponse.fromDB(Map<String, dynamic> json) {
    return CacheResponse(
      url: json['url'],
      response: json['response'],
      statusCode: json['statusCode'],
      message: json['message'],
      stamp: DateTime.parse(json['stamp']),
    );
  }

}