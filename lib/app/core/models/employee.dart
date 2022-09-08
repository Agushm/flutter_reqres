part of 'models.dart';

class Employee {
  Employee({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String name;
  late final String job;
  late final String id;
  String? createdAt;
  String? updatedAt;

  Employee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['job'] = job;
    _data['id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
