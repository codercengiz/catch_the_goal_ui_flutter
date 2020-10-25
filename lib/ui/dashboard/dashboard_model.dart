import 'package:CatchTheGoal/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DashboardModel extends BaseModel {
  String id;
  DateTime day;
  String goalId;
  String goalName;
  String goalType;
  String amount;

  DashboardModel({this.id, this.day, this.goalId, this.goalName});

  @override
  fromJson(Map<String, Object> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
