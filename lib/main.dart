import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pockeet/core/init/navigation/concrete/navigation_manager.dart';
import 'package:pockeet/core/init/navigation/concrete/navigation_route.dart';
import 'package:pockeet/feature/navigate/view/navigate_view.dart';
import 'package:pockeet/feature/navigate/viewmodel/navigate_bloc.dart';
import 'package:pockeet/feature/transaction/view/transaction_view.dart';
import 'core/constants/app_constants.dart';
import 'core/init/langugae/language_manager.dart';
import 'core/theme/app_theme.dart';
import 'feature/onboard/view/onboard_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [LanguageManager.instance.enLocale, LanguageManager.instance.trLocale],
      path: AppConstants.langAssetsPath,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationManager.instance.navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: ThemeManager.createTheme(AppDarkTheme()),
      home: BlocProvider(
        create: (context) => NavigateBloc(),
        child: NavigateView(),
      ),
    );
  }
}
