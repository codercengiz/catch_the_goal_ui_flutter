import 'package:CatchTheGoal/core/base/model/base_model.dart';

class DashboardModel extends BaseModel {
  String id;
  String userId;
  String day;
  String goalId;
  String goalType;
  String goalName;
  int target;
  int amount;
  int result;
  int percent;

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
      this.percent});

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
    percent = json['percent'];
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
    data['percent'] = this.percent;
    return data;
  }

  @override
  DashboardModel fromJson(Map<String, Object> json) =>
      DashboardModel.fromJson(json);
}
