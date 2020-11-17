import 'package:CatchTheGoal/core/base/state/base_state.dart';
import 'package:CatchTheGoal/core/base/view/base_widget.dart';
import 'package:CatchTheGoal/core/constants/app/theme_constants.dart';
import 'package:CatchTheGoal/core/constants/app/app_constants.dart';
import 'package:CatchTheGoal/ui/model/dashboard_model.dart';
import 'package:CatchTheGoal/ui/viewmodel/dashboard_view_model.dart';
import 'package:CatchTheGoal/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:horizontal_calendar_widget/horizontal_calendar.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends BaseState<DashboardView> {
  DashboardViewModel viewModel = DashboardViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      viewModel: DashboardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: body,
      );

  AppBar appBar() {
    return AppBar(
      /* leading: Column(
        children: [
          Observer(builder: (_) => Text(viewModel.number.toString())),
          Observer(
              builder: (_) =>
                  Text(viewModel.dashboardModel[0].goalName.toString())),
        ],
      ), */
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

  Widget get body {
    return Container(
      child: Column(
        children: <Widget>[
          HorizontalCalendar(
            key: UniqueKey(),
            //height: 100,

            //padding: EdgeInsets.all(5),

            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(new Duration(days: 100)),
            dateFormat: 'dd',
            weekDayFormat: 'EEE',
            monthFormat: 'MMM',
            dateTextStyle: TextStyle(fontSize: 15),
            monthTextStyle: TextStyle(fontSize: 15),
            weekDayTextStyle: TextStyle(fontSize: 15),
            scrollController: ScrollController(initialScrollOffset: 0),
            defaultDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.rectangle,
              borderRadius: BoxShape.rectangle == BoxShape.rectangle && true
                  ? BorderRadius.circular(8)
                  : null,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.rectangle,
              borderRadius: BoxShape.rectangle == BoxShape.rectangle && true
                  ? BorderRadius.circular(8)
                  : null,
            ),
            disabledDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.rectangle,
              borderRadius: BoxShape.rectangle == BoxShape.rectangle && true
                  ? BorderRadius.circular(8)
                  : null,
            ),
            isDateDisabled: (date) => date.weekday == DateTime.sunday,
            //labelOrder: order.map(toLabelType).toList(),
            minSelectedDateCount: 1,
            maxSelectedDateCount: 1,
            initialSelectedDates: [DateTime.now()],
          ),
          Expanded(
            child: Column(
              children: [
                Observer(builder: (_) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: viewModel.goalListForDashboard.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return goalItem(viewModel,
                            viewModel.goalListForDashboard[index], index);
                      });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration boxDecoration(
      {double radius = 2,
      Color color = Colors.transparent,
      Color bgColor = Colors.white,
      var showShadow = false}) {
    return BoxDecoration(
      color: bgColor,
      boxShadow: showShadow
          ? [
              BoxShadow(
                  color: Colors.transparent, blurRadius: 2, spreadRadius: 2)
            ]
          : [BoxShadow(color: Colors.grey)],
      border: Border.all(color: Colors.grey[100]),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  Widget goalItem(DashboardViewModel viewModel, DashboardModel model, int pos) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Container(
          decoration: boxDecoration(radius: 0, showShadow: true),
          child: Stack(
            children: <Widget>[
              Observer(builder: (_) {
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            text(model.goalName,
                                                textColor: textColorPrimary,
                                                fontFamily: ApplicationConstants
                                                    .font_bold,
                                                fontSize: ApplicationConstants
                                                    .text_size_normal,
                                                isCentered: false,
                                                maxLine: 2),
                                            text(
                                                model.amount.toString() +
                                                    " / " +
                                                    model.target.toString() +
                                                    " " +
                                                    model.unit,
                                                textColor: (model.amount >=
                                                        model.target
                                                    ? Colors.green
                                                    : Colors.red),
                                                fontFamily: ApplicationConstants
                                                    .font_medium,
                                                fontSize: ApplicationConstants
                                                    .text_size_small,
                                                isCentered: false,
                                                maxLine: 1),
                                          ],
                                        ),
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Checkbox(
                                              value: model.isCompleted,
                                              onChanged: (bool newValue) =>
                                                  viewModel.isCompletedClicked(
                                                      model),
                                            ),
                                            Switch(
                                              value: model.isCompleted,
                                              activeColor: Color(0xFF6200EE),
                                              onChanged: (bool newValue) =>
                                                  viewModel.isCompletedClicked(
                                                      model),
                                            ),
                                          ]),
                                      IconButton(
                                        icon: Icon(Icons.more_vert),
                                        tooltip: 'Increase volume by 10',
                                        onPressed: () {},
                                      ),
                                    ],
                                  )
                                  /*text("model.designation",
                                      fontSize: ApplicationConstants
                                          .text_size_large_medium,
                                      textColor: textColorPrimary,
                                      fontFamily:
                                          ApplicationConstants.font_medium),*/
                                ],
                              ),
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      )
                    ],
                  ),
                );
              }),
              Container(
                width: 4,
                height: 25,
                margin: EdgeInsets.only(top: 12),
                color: pos % 2 == 0 ? textColorPrimary : color_primary,
              )
            ],
          ),
        ));
  }

  Text textWelcomeWidget() => Text("LocaleKeys.welcome.locale");

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel.incrementNumber(),
    );
  }
}

/* 
  Widget get scaffoldBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      ); */

extension _FormArea on _DashboardViewState {
  TextFormField get mailField => TextFormField(
      //validator: (value) => value.isValidEmail,
      );
}
