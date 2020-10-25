import 'package:CatchTheGoal/core/constants/app/app_constants.dart';
import 'package:CatchTheGoal/core/init/language/language_manager.dart';
import 'package:CatchTheGoal/core/init/language/locale_keys.g.dart';
import 'package:CatchTheGoal/core/init/navigation/navigation_route.dart';
import 'package:CatchTheGoal/core/init/navigation/navigation_service.dart';
import 'package:CatchTheGoal/core/init/notifier/provider_list.dart';
import 'package:CatchTheGoal/core/init/notifier/theme_notifier.dart';
import 'package:CatchTheGoal/ui/test/view/test_view.dart';
import 'package:CatchTheGoal/ui/view/dashboard/dashboard_view.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/init/services/cache/local_manager.dart';

void main() {
  LocaleManager.preferencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.uiChangesItems],
    child: EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANGUAGE_ASSET_PATH),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: DashboardView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
