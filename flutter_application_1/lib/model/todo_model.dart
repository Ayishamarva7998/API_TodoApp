class TodoModel {
  String? id;
  String? title;
  String? description;

  TodoModel({this.id, required this.title, required this.description});
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'], title: json['title'], description: json['description']);
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    // ignore: unnecessary_this
    data['id'] = this.id;
    // ignore: unnecessary_this
    data['title'] = this.title;
    // ignore: unnecessary_this
    data['description'] = this.description; 
    return data;
  }
}