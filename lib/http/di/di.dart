import 'package:currency_converter/di.dart';
import 'package:currency_converter/http/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';

const ExchangerateHttpClient = 'ExchangerateHttpClient';

void setupInterceptors() {
  inject<Dio>(instanceName: ExchangerateHttpClient)
      .interceptors
      .add(AuthInterceptor(key: 'YOUR_API_KEY'));
}
