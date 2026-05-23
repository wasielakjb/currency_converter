import 'package:currency_converter/extensions/json.dart';
import 'package:currency_converter/extensions/map_extension.dart';
import 'package:currency_converter/extensions/reactive_form_extension.dart';
import 'package:currency_converter/features/exchangerate/domain/model/supported_currency.dart';
import 'package:currency_converter/features/exchangerate/domain/repository/exchangerate_repository.dart';
import 'package:currency_converter/screens/home/form_builders/converter_fg_factory.dart';
import 'package:currency_converter/screens/home/form_builders/converter_form_keys.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rxdart/rxdart.dart';

part 'converter_form_state.dart';

typedef _K = ConverterFormKeys;

class ConverterFormCubit extends Cubit<ConverterFormState> {
  ConverterFormCubit({
    required this.repository,
  }) : super(ConverterFormState.initial()) {
    init();
  }

  @protected
  final ExchangerateRepository repository;

  FormGroup? _formGroup;
  FormGroup get formGroup => _formGroup ?? FormGroup({});

  SupportedCurrency? get currentSourceCurrency =>
      formGroup.controlVal<SupportedCurrency>(_K.sourceCurrency);
  SupportedCurrency? get currentTargetCurrency =>
      formGroup.controlVal<SupportedCurrency>(_K.targetCurrency);

  Future<void> init() async {
    final sourceCurrency = await getSupportedCurrency('USD');
    final targetCurrency = await getSupportedCurrency('EUR');
    final rate =
        await repository.getPairConversion(sourceCurrency, targetCurrency);
    emit(state.copyWith(currentRate: rate, currentDateTime: DateTime.now()));

    _formGroup = ConverterFormGroupFactory(
      sourceCurrency: sourceCurrency,
      targetCurrency: targetCurrency,
      targetAmount: rate,
    ).create();
    assert(_formGroup != null, 'Form has not been initialized!');

    formGroup.controlVal<SupportedCurrency>(_K.sourceCurrency)!;
    formGroup.controlVal<SupportedCurrency>(_K.targetCurrency)!;

    formGroup.valueChanges.startWith(_formGroup!.value).pairwise().listen(
          (event) => onFormValueChanged(FormChange(event.nonNulls.toList())),
        );
    emit(state.copyWith(initialized: true));
  }

  Future<void> onFormValueChanged(FormChange changes) async {
    final sourceCurrency = changes.get<SupportedCurrency>(_K.sourceCurrency);
    final targetCurrency = changes.get<SupportedCurrency>(_K.targetCurrency);
    final sourceAmount = changes.get<double>(_K.sourceAmount);
    final targetAmount = changes.get<double>(_K.targetAmount);

    if (sourceCurrency.changed || targetCurrency.changed) {
      if (sourceCurrency.current! == targetCurrency.current!) {
        formGroup.control(_K.targetAmount).patchValue(1.0);
        return;
      }
      final response = await repository.getPairConversion(
        sourceCurrency.current!,
        targetCurrency.current!,
      );
      formGroup
          .control(_K.targetAmount)
          .patchValue(sourceAmount.current! * response);
      emit(
        state.copyWith(
          currentRate: response,
          currentDateTime: DateTime.now(),
        ),
      );
      return;
    }

    if (sourceAmount.changed && sourceAmount.current != null) {
      formGroup
          .control(_K.targetAmount)
          .patchValue(sourceAmount.current! * state.currentRate);
      return;
    }

    if (targetAmount.current != null) {
      formGroup
          .control(_K.sourceAmount)
          .patchValue(targetAmount.current! / state.currentRate);
    }
  }

  Future<SupportedCurrency> getSupportedCurrency(String code) async {
    final supportedCodes = await repository.getSupportedCodes();
    return supportedCodes.firstWhere((e) => e.code == code);
  }
}
