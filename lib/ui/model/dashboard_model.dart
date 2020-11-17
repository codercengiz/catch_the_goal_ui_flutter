import 'package:CatchTheGoal/core/base/model/base_model.dart';

class DashboardModel with BaseModel {
  String id;
  String userId;
  String day;
  String goalId;
  String goalType;
  String goalName;
  int target;
  int amount;
  int result;
  String unit;
  int percent;
  bool isCompleted;

  DashboardModel(
      {this.id,
      this.userId,
      this.day,
      this.goalId,
      this.goalType,
      this.goalName,
      this.target,
      this.amount,
      this.result,
      this.unit,
      this.percent,
      this.isCompleted});

  @override
  DashboardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    day = json['day'];
    goalId = json['goal_id'];
    goalType = json['goal_type'];
    goalName = json['goal_name'];
    target = json['target'];
    amount = json['amount'];
    result = json['result'];
    unit = json['unit'];
    percent = json['percent'];
    isCompleted = json['is_completed'] == 1 ? true : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['day'] = this.day;
    data['goal_id'] = this.goalId;
    data['goal_type'] = this.goalType;
    data['goal_name'] = this.goalName;
    data['target'] = this.target;
    data['amount'] = this.amount;
    data['result'] = this.result;
    data['unit'] = this.unit;
    data['percent'] = this.percent;
    data['is_completed'] = this.isCompleted ? 1 : 0;
    return data;
  }

  @override
  DashboardModel fromJson(Map<String, Object> json) =>
      DashboardModel.fromJson(json);
}
