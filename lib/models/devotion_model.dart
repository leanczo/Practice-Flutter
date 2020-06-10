class DevotionModel {
  DevotionModel({this.userId,
    this.Id,
    this.title,
    this.completed,}
  );

  int userId;
  int Id;
  String title;
  bool completed;

  factory DevotionModel.fromMap(Map<String, dynamic> json) {
    return DevotionModel(
      userId: json['userId'].toInt(),
      Id: json['Id'],
      title: json['title'],
      completed: json['completed'],

    );
  }
}