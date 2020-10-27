import 'dart:convert';

import 'package:CatchTheGoal/core/base/model/base_view_model.dart';
import 'package:CatchTheGoal/core/constants/enums/app_theme_enum.dart';
import 'package:CatchTheGoal/core/init/notifier/theme_notifier.dart';
import 'package:CatchTheGoal/ui/model/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'dashboard_view_model.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

abstract class _DashboardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) {
    this.context = context;
  }

  void init() {
    String value = '''{
            "id": "af2a8df8-8244-411f-9bb3-eb6778734e5d",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "046bc91f-88bb-41d2-be88-020e12cbe029",
            "goal_type": "Do Task",
            "goal_name": "Call Mom",
            "target": "1",
            "amount": "1",
            "result": "1",
            "percent": "100"
        }''';
    dashboardModel.add(DashboardModel.fromJson(json.decode(value)));
  }

  List<DashboardModel> dashboardModel;
  @observable
  bool isLoading = false;

  @observable
  int number = 2000;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;

    //final response = await coreDio.fetch<List<TestModel>, TestModel>("x",
    //    type: HttpTypes.GET, parseModel: TestModel());
    //if (response.data is List<TestModel>) {
    // } else {}
    isLoading = false;
  }
}
