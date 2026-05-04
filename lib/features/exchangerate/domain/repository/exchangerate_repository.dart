import 'package:currency_converter/features/exchangerate/domain/model/supported_currency.dart';

abstract interface class ExchangerateRepository {
  Future<List<SupportedCurrency>> getSupportedCodes();

  Future<double> getPairConversion(String base, String target);
}
