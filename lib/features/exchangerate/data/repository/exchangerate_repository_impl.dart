import 'package:currency_converter/features/exchangerate/data/data_source/exchangerate_remote_ds.dart';
import 'package:currency_converter/features/exchangerate/data/mappers/supported_currency_mapper.dart';
import 'package:currency_converter/features/exchangerate/domain/model/supported_currency.dart';
import 'package:currency_converter/features/exchangerate/domain/repository/exchangerate_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ExchangerateRepository)
class ExchangerateRepositoryImpl implements ExchangerateRepository {
  const ExchangerateRepositoryImpl({required this.remoteDS});

  @protected
  final ExchangerateRemoteDataSource remoteDS;

  @override
  Future<double> getPairConversion(String base, String target) {
    return remoteDS.fetchPairConversion(base, target);
  }

  @override
  Future<List<SupportedCurrency>> getSupportedCodes() {
    return remoteDS
        .fetchSupportedCodes()
        .then((res) => res.map((e) => e.asEntity()).toList());
  }
}
