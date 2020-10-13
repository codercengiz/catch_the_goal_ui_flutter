import 'package:CatchTheGoal/core/constants/app/app_constants.dart';
import 'package:CatchTheGoal/core/init/language/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() => runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: LanguageManager.instance.supportedLocales,
    path: ApplicationConstants.LANGUAGE_ASSET_PATH));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Dismissible(
            background: Container(
              color: Colors.deepOrange,
              child: Text("datara"),
            ),
            key: UniqueKey(),
            child: buildc,
          ),
        ),
      ),
    );
  }
}
