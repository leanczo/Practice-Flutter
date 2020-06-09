import 'dart:convert';
import 'dart:io';

class ImageModel {
  final int id;
  final String path;
  final String url;

  ImageModel({this.id, this.path, this.url});

  factory ImageModel.fromMap(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'].toInt(),
      path: json['path'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "path": path,
    "url": url,
  };

  Map<String, dynamic> toApi() => {
    "fileName": "$id.jpg",
    "mimeType": "image/jpeg",
    "base64": getBase64(),
  };

  getBase64() {
    var img = File.fromUri(Uri.parse(this.path));
    var bytes = img.readAsBytesSync();
    var result = base64.encode(bytes);
    return result;
    //return 'base64encodedHere';
  }
}
