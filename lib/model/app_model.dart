class AppModel {
  String? title;
  String? id;

  AppModel({this.title, this.id});

  AppModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
  }
}
