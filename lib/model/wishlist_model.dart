class WishListModel {
  String? id;
  String? title;
  String? description;
  int? price;
  String? image;

  WishListModel({
    this.title,
    this.id,
    this.description,
    this.image,
    this.price,
  });

  Map<String, dynamic> toWishList(String token) {
    final Map<String, dynamic> data = {'product': id};
    final Map<String, String> headers = {'Authorization': token};
    return {'data': data, 'headers': headers};
  }
}
