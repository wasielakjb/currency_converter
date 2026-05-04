import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/di.dart';
import 'package:currency_converter/screens/home/routing/home_routes.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => inject<HomeRoutes>().routes;
}
