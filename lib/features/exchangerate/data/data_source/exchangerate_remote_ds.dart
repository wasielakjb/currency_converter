import 'package:currency_converter/extensions/json.dart';
import 'package:currency_converter/features/exchangerate/data/model/network_supported_currency.dart';
import 'package:currency_converter/http/di/di.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class ExchangerateRemoteDataSource {
  ExchangerateRemoteDataSource({
    @Named(ExchangerateHttpClient) required this.httpClient,
  });

  @protected
  final Dio httpClient;

  Future<List<NetworkSupportedCurrency>> fetchSupportedCodes() async {
    return httpClient.get<Json>('/v6/codes').then(
          (res) => (res.data!['supported_codes'] as List)
              .map((e) => NetworkSupportedCurrency.fromList(e as List))
              .toList(),
        );
  }

  Future<double> fetchPairConversion(String base, String target) async {
    return httpClient
        .get<Json>('/v6/pair/$base/$target')
        .then((res) => res.data!['conversion_rate'] as double);
  }
}
