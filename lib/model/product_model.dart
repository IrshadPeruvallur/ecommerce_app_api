class ProductModel {
  String? id;
  String? title;
  String? description;
  int? price;
  String? image;

  ProductModel({this.title, this.id, this.description, this.image, this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      '_id': this.id,
      'title': this.title,
      'description': this.description,
      'price': this.price,
      'image': this.image,
    };
    return data;
  }
}
