import 'package:currency_converter/features/exchangerate/domain/model/supported_currency.dart';
import 'package:currency_converter/screens/home/form_builders/converter_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = ConverterFormKeys;

class ConverterFormGroupFactory {
  ConverterFormGroupFactory({
    required this.sourceCurrency,
    required this.targetCurrency,
    required this.targetAmount,
  });

  final SupportedCurrency sourceCurrency;
  final SupportedCurrency targetCurrency;
  final double targetAmount;

  FormGroup create() {
    return FormGroup({
      _K.sourceAmount: FormControl<double>(
        value: 1,
      ),
      _K.targetAmount: FormControl<double>(
        value: targetAmount,
      ),
      _K.sourceCurrency: FormControl<SupportedCurrency>(
        value: sourceCurrency,
      ),
      _K.targetCurrency: FormControl<SupportedCurrency>(
        value: targetCurrency,
      ),
    });
  }
}
