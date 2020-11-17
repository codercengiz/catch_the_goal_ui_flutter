import 'dart:convert';

import 'package:CatchTheGoal/core/base/model/base_view_model.dart';
import 'package:CatchTheGoal/core/constants/enums/app_theme_enum.dart';
import 'package:CatchTheGoal/core/database/db_helper.dart';
import 'package:CatchTheGoal/core/init/notifier/theme_notifier.dart';
import 'package:CatchTheGoal/ui/model/dashboard_model.dart';
import 'package:CatchTheGoal/ui/view/dashboard/dashboard_database_provider.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
part 'dashboard_view_model.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

abstract class _DashboardViewModelBase with Store, BaseViewModel {
  DashboardDatabaseProvider dashboardDatabaseProvider;

  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<void> init() async {
    String value = ''' [
        {
            "id": "af2a8df8-8244-411f-9bb3-eb6778734e5d",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "046bc91f-88bb-41d2-be88-020e12cbe029",
            "goal_type": "Do Task",
            "goal_name": "Call Mom",
            "target": 1,
            "amount": 1,
            "result": 1,
            "unit": "qt",
            "percent": 100,
            "is_completed":true
        },
        {
            "id": "0fbcd73b-4055-49ce-a642-d91711671b2f",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "ebba53be-bb78-4a36-a91c-b77318be0500",
            "goal_type": "Don’t do Task",
            "goal_name": "Alkohol",
            "target": 0,
            "amount": 0,
            "result": 1,
            "unit": "qt",
            "percent":100,
            "is_completed":true
        },
        {
            "id": "aa058e03-2bd4-480a-adf6-a13df59c552c",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "e6f8e72b-50c9-473e-8199-1f5b2bdcfb87",
            "goal_type": "Minumum Target",
            "goal_name": "Book read",
            "target": 20,
            "amount": 20,
            "result": 1,
            "unit": "qt",
            "percent": 100,
            "is_completed":true
        },
        {
            "id": "04fa63f9-cc66-46b8-9ba9-5016279de27a",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "aad2b762-81d8-45b4-90db-4f540b7b90f3",
            "goal_type": "Maximum Target",
            "goal_name": "Chocalate Eat",
            "target": 5,
            "amount": 5,
            "result":1,
            "unit": "qt",
            "percent": 100,
            "is_completed":true
        },
        {
            "id": "6acfea4c-f4d2-46eb-a16d-399a3a6ff2df",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "6e59872c-ec80-413d-b202-c5a3c0c191fc",
            "goal_type": "Desired Target",
            "goal_name": "TOEFL",
            "target": 299,
            "amount": 210,
            "result": 1,
            "unit": "qt",
            "percent": 100,
            "is_completed":true
        },
        {
            "id": "2c6d20d3-eba4-4a9b-8cd5-dbf46c879520",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "ad33972c-9af6-4e4f-9e59-35b140634065",
            "goal_type": "Minumum Target",
            "goal_name": "Run",
            "target": 20,
            "amount": 50,
            "result": 1,
            "unit": "qt",
            "percent": 250,
            "is_completed":false
        },
        {
            "id": "07609c37-942d-4908-91a0-f6b78b6b16a6",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "8f29a41a-4d96-468d-bd20-6c27eec64702",
            "goal_type": "Minumum Target",
            "goal_name": "Homework",
            "target": 30,
            "amount": 40,
            "result": 1,
            "unit": "qt",
            "percent": 130,
            "is_completed":false
        },
        {
            "id": "a621d841-a38f-4e6c-a5a1-961188ad4430",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "363c9e46-57be-4e7a-bf39-97cdef7f784f",
            "goal_type": "Minumum Target",
            "goal_name": "Prey",
            "target": 20,
            "amount": 20,
            "result": 1,
            "unit": "qt",
            "percent": 100,
            "is_completed":true
        },
        {
            "id": "bc70834a-4abe-4e30-9789-22f61f41b00d",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "3fe7af75-1af0-4866-b228-ed74f63680a3",
            "goal_type": "Minumum Target",
            "goal_name": "Word Lern",
            "target": 10,
            "amount": 10,
            "result": 1,
            "unit": "qt",
            "percent": 100,
            "is_completed":true
        },
        {
            "id": "5ca30cc8-6339-49c9-9875-56c697de8424",
            "user_id": "a3683206-8312-4449-bed3-9ca66e80f1b4",
            "day": "25.10.2017",
            "goal_id": "61a6d216-f839-4f0f-b98c-9daab23f29c6",
            "goal_type": "Minumum Target",
            "goal_name": "Walking",
            "target": 2000,
            "amount": 1000,
            "result": 0,
            "unit": "qt",
            "percent":50,
            "is_completed":true
        }
    ]
        ''';

    dashboardDatabaseProvider = DashboardDatabaseProvider();
    await dashboardDatabaseProvider.open();
    goalListForDashboard = new ObservableList();
    var goalListForDashboard_ = await dashboardDatabaseProvider.getList();

    /*  List<DashboardModel> goalListForDashboard_ = (json.decode(value) as List)
        .map((i) => DashboardModel.fromJson(i))
        .toList(); */
    goalListForDashboard_.forEach((element) {
      goalListForDashboard.add(element);
      //if (abc.length == 0) dashboardDatabaseProvider.insertItem(element);
    });
  }

  @observable
  ObservableList<DashboardModel> goalListForDashboard;
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

  @action
  void isCompletedClicked(DashboardModel model) {
    var abc = model;
    model.isCompleted = !model.isCompleted;
    this
        .goalListForDashboard
        .firstWhere((element) => element.id == model.id)
        .isCompleted = model.isCompleted;

    goalListForDashboard = goalListForDashboard;
  }

  @action
  void select() {
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
