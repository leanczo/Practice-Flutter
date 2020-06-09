class OptionModel {
  final int id;
  final int optionContainerId;
  final int position;
  final String key;
  final String value;
  bool selected;

  OptionModel(
      {this.id,
        this.optionContainerId,
        this.position,
        this.key,
        this.value,
        this.selected = false});

  factory OptionModel.fromMap(Map<String, dynamic> json) {
    return OptionModel(
      id: json['fieldOptionId'],
      optionContainerId: json['fieldId'],
      position: json['position'],
      key: json['key'],
      value: json['value'],
      selected: json['selected'] == null ? false : json['selected'],
    );
  }

  Map<String, dynamic> toMap() => {
    "fieldOptionId": id,
    "fieldId": optionContainerId,
    "position": position,
    "key": key,
    "value": value,
    "selected": selected,
  };
}
