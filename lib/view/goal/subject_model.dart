import 'package:flutter/widgets.dart';

class SubjectModel {
  String id;
  String name;
  String unit;
  DateTime createdate;
  String type;

  SubjectModel({this.id, this.name, this.unit, this.createdate, this.type});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
    createdate = json['createdate'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['unit'] = this.unit;
    data['createdate'] = this.createdate;
    data['type'] = this.type;
    return data;
  }
}
