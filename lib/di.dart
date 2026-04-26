import 'package:currency_converter/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

T inject<T extends Object>({
  dynamic param1,
  dynamic param2,
  String? instanceName,
  Type? type,
}) =>
    getIt.get<T>(
      param1: param1,
      param2: param2,
      instanceName: instanceName,
      type: type,
    );
