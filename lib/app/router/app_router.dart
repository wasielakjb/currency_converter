import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/app/router/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          initial: true,
          page: HomeRoute.page,
        ),
      ];
}
