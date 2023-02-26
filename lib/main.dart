import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:skybase/core/app/app_env.dart';
import 'package:skybase/core/app/app_info.dart';
import 'package:skybase/core/firebase/analytics/analytics_helper.dart';
import 'package:skybase/core/localization/app_translations.dart';
import 'package:skybase/core/localization/locale_helper.dart';
import 'package:skybase/core/themes/app_theme.dart';
import 'package:skybase/core/themes/theme_manager.dart';
import 'package:skybase/firebase_options.dart';
import 'package:skybase/initializer.dart';
import 'package:skybase/ui/routes/app_routes.dart';

import 'app_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Initializer.init();
  AppEnv.set(Env.DEVELOPMENT);
  AppInfo.setInfo(await PackageInfo.fromPlatform());
  if (AppEnv.env == Env.DEVELOPMENT) {
    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const App(),
      ),
    );
  } else {
    await initializeDateFormatting('id', null);
    runApp(const App());
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeManager>(
      builder: (ctr) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConfiguration.appName,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: (ctr.isDark.isTrue) ? ThemeMode.dark : ThemeMode.light,
        translations: AppTranslation(),
        locale: LocaleHelper().getCurrentLocale(),
        fallbackLocale: LocaleHelper().fallbackLocale,
        getPages: AppPages.routes,
        initialRoute: AppPages.initial,
        navigatorObservers: [
          AnalyticsHelper().routeObserver,
        ],
      ),
    );
  }
}
