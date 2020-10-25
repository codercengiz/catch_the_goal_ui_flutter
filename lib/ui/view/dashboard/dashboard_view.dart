import 'package:CatchTheGoal/core/base/state/base_state.dart';
import 'package:CatchTheGoal/core/base/view/base_widget.dart';
import 'package:CatchTheGoal/ui/viewmodel/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DashbaordView extends StatefulWidget {
  @override
  _DashbaordViewState createState() => _DashbaordViewState();
}

class _DashbaordViewState extends BaseState<DashbaordView> {
  DashboardViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      viewModel: DashboardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  AppBar appBar() {
    return AppBar(
      leading: Text("sdasdasdas"),
      title: textWelcomeWidget(),
      actions: [iconButtonChangeTheme()],
    );
  }

  IconButton iconButtonChangeTheme() {
    return IconButton(
        icon: Icon(Icons.change_history),
        onPressed: () {
          //context.locale = LanguageManager.instance.enLocale;
        });
  }

  Widget get textNumber {
    return Column(
      children: <Widget>[
        Observer(
          builder: (context) => Text(
            viewModel.number.toString(),
          ),
        ),
      ],
    );
  }

  Text textWelcomeWidget() => Text("LocaleKeys.welcome.locale");

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel.incrementNumber(),
    );
  }
}

extension _FormArea on _DashbaordViewState {
  TextFormField get mailField => TextFormField(
      //validator: (value) => value.isValidEmail,
      );
}
