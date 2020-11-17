// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardViewModel on _DashboardViewModelBase, Store {
  Computed<bool> _$isEvenComputed;

  @override
  bool get isEven => (_$isEvenComputed ??= Computed<bool>(() => super.isEven,
          name: '_DashboardViewModelBase.isEven'))
      .value;

  final _$goalListForDashboardAtom =
      Atom(name: '_DashboardViewModelBase.goalListForDashboard');

  @override
  ObservableList<DashboardModel> get goalListForDashboard {
    _$goalListForDashboardAtom.reportRead();
    return super.goalListForDashboard;
  }

  @override
  set goalListForDashboard(ObservableList<DashboardModel> value) {
    _$goalListForDashboardAtom.reportWrite(value, super.goalListForDashboard,
        () {
      super.goalListForDashboard = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_DashboardViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$numberAtom = Atom(name: '_DashboardViewModelBase.number');

  @override
  int get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(int value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$getSampleRequestAsyncAction =
      AsyncAction('_DashboardViewModelBase.getSampleRequest');

  @override
  Future<void> getSampleRequest() {
    return _$getSampleRequestAsyncAction.run(() => super.getSampleRequest());
  }

  final _$_DashboardViewModelBaseActionController =
      ActionController(name: '_DashboardViewModelBase');

  @override
  void incrementNumber() {
    final _$actionInfo = _$_DashboardViewModelBaseActionController.startAction(
        name: '_DashboardViewModelBase.incrementNumber');
    try {
      return super.incrementNumber();
    } finally {
      _$_DashboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isCompletedClicked(DashboardModel model) {
    final _$actionInfo = _$_DashboardViewModelBaseActionController.startAction(
        name: '_DashboardViewModelBase.isCompletedClicked');
    try {
      return super.isCompletedClicked(model);
    } finally {
      _$_DashboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void select() {
    final _$actionInfo = _$_DashboardViewModelBaseActionController.startAction(
        name: '_DashboardViewModelBase.select');
    try {
      return super.select();
    } finally {
      _$_DashboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
goalListForDashboard: ${goalListForDashboard},
isLoading: ${isLoading},
number: ${number},
isEven: ${isEven}
    ''';
  }
}
