class AppModel {
  String? id;
  String? title;
  String? description;
  int? price;
  String? image;

  AppModel({this.title, this.id, this.description, this.image, this.price});

  AppModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
