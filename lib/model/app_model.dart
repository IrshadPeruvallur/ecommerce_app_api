// class AppModel {
//   String? title;
//   String? id;

//   AppModel(this.title, this.id);

//   AppModel.fromJson(Map<String, dynamic> json) {
//     // Assuming 'allProducts' is a List in 'data' Map
//     if (json['data'] != null && json['data']['allProducts'] != null) {
//       // Assuming you want to get the first product in the list
//       final List<dynamic> allProducts = json['data']['allProducts'];
//       if (allProducts.isNotEmpty) {
//         // Extracting title and id from the first item in the list
//         title = allProducts[0]['title'];
//         id = allProducts[0]['_id'];
//       }
//     }
//   }
// }

class DataApi {
  String? status;
  Data? data;

  DataApi({this.status, this.data});

  DataApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<AllProducts>? allProducts;

  Data({this.allProducts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['allProducts'] != null) {
      allProducts = <AllProducts>[];
      json['allProducts'].forEach((v) {
        allProducts!.add(new AllProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allProducts != null) {
      data['allProducts'] = this.allProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllProducts {
  String? sId;
  String? title;
  String? description;
  int? price;
  String? image;
  String? category;
  bool? isDeleted;
  int? iV;

  AllProducts(
      {this.sId,
      this.title,
      this.description,
      this.price,
      this.image,
      this.category,
      this.isDeleted,
      this.iV});

  AllProducts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    category = json['category'];
    isDeleted = json['isDeleted'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['category'] = this.category;
    data['isDeleted'] = this.isDeleted;
    data['__v'] = this.iV;
    return data;
  }
}
