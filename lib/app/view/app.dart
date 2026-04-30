import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/app/cubit/app_theme_cubit.dart';
import 'package:currency_converter/app/router/app_router.dart';
import 'package:currency_converter/app/theme/app_theme.dart';
import 'package:currency_converter/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  final router = inject<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<AppThemeCubit>(),
      child: BlocBuilder<AppThemeCubit, ThemeMode>(
        builder: (context, themeMode) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light, //themeMode,
          routerConfig: router.config(
            navigatorObservers: () => [AutoRouteObserver()],
          ),
        ),
      ),
    );
  }
}
