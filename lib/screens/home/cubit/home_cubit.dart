import 'package:currency_converter/extensions/reactive_form_extension.dart';
import 'package:currency_converter/features/exchangerate/domain/model/supported_currency.dart';
import 'package:currency_converter/features/exchangerate/domain/repository/exchangerate_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rxdart/rxdart.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.repository}) : super(HomeState.initial()) {
    init();
  }

  @protected
  final ExchangerateRepository repository;

  FormGroup? _formGroup;
  FormGroup get formGroup => _formGroup ?? FormGroup({});

  Future<void> init() async {
    _formGroup = await create();
    formGroup.valueChanges
        .startWith(_formGroup!.value)
        .pairwise()
        .listen((_) => submit());
    emit(state.copyWith(initialized: true));
  }

  Future<FormGroup> create() async {
    return FormGroup({
      'from_amount': FormControl<double>(),
      'to_amount': FormControl<double>(),
      'from': FormControl<SupportedCurrency>(
        value: await getSupportedCurrency('USD'),
      ),
      'to': FormControl<SupportedCurrency>(
        value: await getSupportedCurrency('EUR'),
      ),
    });
  }

  Future<SupportedCurrency> getSupportedCurrency(String code) async {
    final supportedCodes = await repository.getSupportedCodes();
    return supportedCodes.firstWhere((e) => e.code == code);
  }

  Future<void> submit() async {
    formGroup.markAllAsTouched();
    if (formGroup.invalid) return;

    emit(state.copyWith(pending: true));
    final base = formGroup.controlVal<SupportedCurrency>('from')!;
    final target = formGroup.controlVal<SupportedCurrency>('to')!;
    final response = await repository.getPairConversion(base, target);
    final value = formGroup.controlVal<double>('from_amount') ?? 0 * response;
    formGroup.control('to_amount').patchValue(value);
    emit(state.copyWith(pending: false));
  }
}
