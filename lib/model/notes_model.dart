class NotesModel {
  String? name;
  String? lastName;
  String? date;
  String? content;

  NotesModel({this.name, this.lastName, this.date, this.content});

  NotesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
    date = json['date'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json.addAll(
        {'name': name, 'lastName': lastName, 'date': date, 'content': content});
    return json;
  }
}
