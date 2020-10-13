import 'package:CatchTheGoal/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight(0.1),
      child: Placeholder(),
      color: themeData.primaryColor,
    );
  }
}
