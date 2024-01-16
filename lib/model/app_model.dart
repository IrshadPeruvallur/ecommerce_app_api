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
}
