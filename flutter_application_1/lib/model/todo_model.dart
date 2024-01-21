class TodoModel {
  String? id;
  String? title;
  String? description;

  TodoModel({this.id, required this.title, required this.description});
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'], title: json['title'], description: json['notes']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['notes'] = this.description;
    return data;
  }
}