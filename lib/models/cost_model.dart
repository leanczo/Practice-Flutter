import 'dart:convert';
import '../models/job_model.dart';
import '../models/option_container_model.dart';
import 'image_model.dart';

class CostModel {
  final int id;
  final int changeOrderId;
  final int taskId;
  final String display;
  String description;
  int progress;
  DateTime startDate;
  List<ImageModel> images = new List();
  List<OptionContainerModel> options = new List();
  List<JobModel> jobs = new List();

  CostModel(
      {this.id,
        this.changeOrderId,
        this.taskId,
        this.display,
        this.description,
        this.progress,
        this.startDate,
        this.images,
        this.jobs});

  factory CostModel.fromMap(Map<String, dynamic> json) {
    return CostModel(
      id: json['taskId'].toInt(),
      changeOrderId: json['orderId'],
      taskId: json['costCodeId'].toInt(),
      display: json['display'],
      description: json['description'],
      progress: json['progress'] != null ? (json['progress'] * 100).toInt() : 0,
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : null, //startDate
      images: json['images'] != null
          ? List<ImageModel>.from(
          json['images'].map((x) => ImageModel.fromMap(x)))
          : [],
      jobs: json['jobs'] != null
          ? List<JobModel>.from(json['jobs'].map((x) => JobModel.fromMap(x)))
          : [],
    );
  }

  Map<String, dynamic> toMap({bool toSyncWithApi = false}) => {
    "taskId": id,
    //"orderId": changeOrderId,
    "costCodeId": taskId,
    "display": display,
    "description": description,
    "progress": double.parse(progress.toString()) / 100,
    "startDate":
    startDate != null ? startDate.toIso8601String() : startDate,
    "images": List<dynamic>.from(
        images.map((image) => setImageFormat(image, toSyncWithApi))),
    "jobs": List<dynamic>.from(jobs.map((job) => job.toMap())),
    "options": List<dynamic>.from(options.map((option) => option.toMap())),
  };

  setImageFormat(ImageModel image, bool toSyncWithApi) {
    return toSyncWithApi ? image.toApi() : image.toMap();
  }

  Map<String, dynamic> toDB() => {
    "id": id,
    "changeOrderId": changeOrderId,
    "costCodeId": taskId,
    "display": display,
    "description": description,
    "progress": progress,
    "startDate":
    startDate != null ? startDate.toIso8601String() : startDate,
    "images": json
        .encode(List<dynamic>.from(images.map((image) => image.toMap()))),
  };

  factory CostModel.fromDB(Map<String, dynamic> json) {
    return CostModel(
      id: json['taskId'].toInt(),
      changeOrderId: json['orderId'],
      taskId: json['costCodeId'].toInt(),
      display: json['display'],
      description: json['description'],
      progress: json['progress'].toInt(),
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : null, //startDate
      images: json['images'] != null
          ? List<ImageModel>.from(
          json['images'].map((x) => ImageModel.fromMap(x)))
          : [],
      jobs: json['jobs'] != null
          ? List<JobModel>.from(json['jobs'].map((x) => JobModel.fromMap(x)))
          : [],
    );
  }
}
