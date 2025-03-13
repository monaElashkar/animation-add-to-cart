
class Variants {
  int? id;
  String? name;
  List<String>? attributes;

  Variants({this.id, this.name, this.attributes});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    attributes = json['attributes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['attributes'] = this.attributes;
    return data;
  }
}
