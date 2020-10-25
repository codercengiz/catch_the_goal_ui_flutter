import 'package:CatchTheGoal/core/base/state/base_state.dart';
import 'package:CatchTheGoal/core/base/view/base_widget.dart';
import 'package:CatchTheGoal/ui/dashboard/dashboard_model.dart';
import 'package:flutter/material.dart';

class Dashbaord extends StatefulWidget {
  _DashbaordState createState() => _DashbaordState();
}

class _DashbaordState extends BaseState<Dashbaord> {
  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardModel>(
      viewModel: DashboardModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }
}
