import 'package:currency_converter/features/exchangerate/data/model/network_supported_currency.dart';
import 'package:currency_converter/features/exchangerate/domain/model/supported_currency.dart';

extension SupportedCurrencyMapper on NetworkSupportedCurrency {
  SupportedCurrency asEntity() => SupportedCurrency(code: code, name: name);
}
