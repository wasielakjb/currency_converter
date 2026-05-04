import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/app/router/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeRoutes {
  List<AutoRoute> get routes => [
        CustomRoute<void>(
          path: '/home',
          page: HomeRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];
}
