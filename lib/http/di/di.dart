import 'package:currency_converter/di.dart';
import 'package:currency_converter/http/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';

const ExchangerateHttpClient = 'ExchangerateHttpClient';

void setupInterceptors() {
  inject<Dio>(instanceName: ExchangerateHttpClient)
      .interceptors
      .add(AuthInterceptor(key: 'b2448ba655957bd0a9acc362'));
      //b2448ba655957bd0a9acc362 YOUR_API_KEY
}
