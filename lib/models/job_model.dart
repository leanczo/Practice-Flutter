class JobModel {
  int id;
  int costId;
  final String description;
  final double price;
  final int quantity;

  JobModel({this.id, this.costId, this.description, this.price, this.quantity});

  factory JobModel.fromMap(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      costId: json['costId'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toMap() => {
    //"id": id,
    //"costId": costId,
    "description": description,
    "price": price,
    "quantity": quantity,
  };

  Map<String, dynamic> toCloneMap() => {
    "id": id,
    "costId": costId,
    "description": description,
    "price": price,
    "quantity": quantity,
  };

  factory JobModel.fromDB(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      costId: json['costId'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toDB() => {
    "id": id,
    "costId": costId,
    "description": description,
    "price": price,
    "quantity": quantity,
  };
}
