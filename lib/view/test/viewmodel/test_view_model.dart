import 'package:CatchTheGoal/core/base/model/base_view_model.dart';
import 'package:CatchTheGoal/core/constants/enums/app_theme_enum.dart';
import 'package:CatchTheGoal/core/init/notifier/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../model/test_model.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) {
    //this.context = context;
  }

  void init() {}

  @observable
  bool isLoading = false;

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    //Provider.of<ThemeNotifier>(context, listen: false).changeValue(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;

    //final response = await coreDio.fetch<List<TestModel>, TestModel>("x", type: HttpTypes.GET, parseModel: TestModel());
    //if (response.data is List<TestModel>) {
    //} else {}
    isLoading = false;
  }
}
