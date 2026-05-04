import 'package:currency_converter/http/di/di.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpModule {
  @singleton
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: 'https://v6.exchangerate-api.com',
        listFormat: ListFormat.multiCompatible,
      );

  @Named(ExchangerateHttpClient)
  @singleton
  Dio get exchangerateHttpClient => Dio(baseOptions);
}
