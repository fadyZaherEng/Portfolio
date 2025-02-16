import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/routes/routes_manager.dart';
import 'package:my_portfolio/src/config/theme/app_theme.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/di/injector.dart';
import 'package:my_portfolio/src/presentation/blocs/main/main_bloc.dart';
import 'package:my_portfolio/src/presentation/blocs/main/main_state.dart';
import 'package:my_portfolio/src/presentation/blocs/portfolio/portfolio_bloc.dart';
import 'package:my_portfolio/src/presentation/widgets/restart_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  setPathUrlStrategy();
  runApp(const RestartWidget(MyApp()));
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(create: (context) => injector()),
        BlocProvider<PortfolioBloc>(create: (context) => injector()),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return Portal(
            child: Provider.value(
              value: routeObserver,
              child: kIsWeb
                  ? MaterialApp.router(
                      routerConfig: webRouter,
                      themeMode: ThemeMode.light,
                      supportedLocales: S.delegate.supportedLocales,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      debugShowCheckedModeBanner: false,
                      title: "Fady Zaher Portfolio",
                      theme: state is InitialMainState &&
                              state.theme == Constants.dark
                          ? AppTheme(state.locale.languageCode).dark
                          : state is InitialMainState
                              ? AppTheme(state.locale.languageCode).light
                              : AppTheme(window.locale.languageCode).dark,
                      locale: state is InitialMainState
                          ? state.locale
                          : window.locale,
                    )
                  : MaterialApp(
                      themeMode: ThemeMode.light,
                      supportedLocales: S.delegate.supportedLocales,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      debugShowCheckedModeBanner: false,
                      title: "Fady Zaher",
                      theme: state is InitialMainState &&
                              state.theme == Constants.dark
                          ? AppTheme(state.locale.languageCode).dark
                          : state is InitialMainState
                              ? AppTheme(state.locale.languageCode).light
                              : AppTheme(window.locale.languageCode).dark,
                      locale: state is InitialMainState
                          ? state.locale
                          : window.locale,

                      navigatorKey: navigatorKey,
                      navigatorObservers: [
                        routeObserver,
                      ],
                      onGenerateRoute: RoutesManager.getRoute,
                      initialRoute: Routes.portfolio,

                      // Pass versionCode when navigating to the splash screen
                    ),
            ),
          );
        },
      ),
    );
  }
}
