class UnicornModel {
  String? sId;
  String? name;
  int? age;
  String? colour;

  UnicornModel({this.sId, this.name, this.age, this.colour});

  UnicornModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    age = json['age'];
    colour = json['colour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['age'] = age;
    data['colour'] = colour;
    return data;
  }
}
