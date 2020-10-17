import 'package:CatchTheGoal/core/constants/app/app_constants.dart';
import 'package:CatchTheGoal/core/init/language/language_manager.dart';
import 'package:CatchTheGoal/core/init/language/locale_keys.g.dart';
import 'package:CatchTheGoal/core/init/navigation/navigation_route.dart';
import 'package:CatchTheGoal/core/init/navigation/navigation_service.dart';
import 'package:CatchTheGoal/core/init/notifier/provider_list.dart';
import 'package:CatchTheGoal/core/init/notifier/theme_notifier.dart';
import 'package:CatchTheGoal/view/test/view/test_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: LanguageManager.instance.supportedLocales,
    path: ApplicationConstants.LANGUAGE_ASSET_PATH));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ApplicationProvider.instance.uiChangesItems],
      child: MaterialApp(
        theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
        home: TestsView(),
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      ),
    );
  }
}
