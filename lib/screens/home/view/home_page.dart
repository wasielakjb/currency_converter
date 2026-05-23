import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/di.dart';
import 'package:currency_converter/extensions/text_theme_extension.dart';
import 'package:currency_converter/features/exchangerate/domain/repository/exchangerate_repository.dart';
import 'package:currency_converter/screens/home/cubit/converter_form_cubit.dart';
import 'package:currency_converter/screens/home/form_builders/converter_form_keys.dart';
import 'package:currency_converter/screens/home/widget/amount_currency_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef _K = ConverterFormKeys;

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => ConverterFormCubit(
        repository: inject<ExchangerateRepository>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formCubit = context.watch<ConverterFormCubit>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 48, 20, 0),
          child: BlocBuilder<ConverterFormCubit, ConverterFormState>(
            builder: (context, state) => Skeletonizer(
              enabled: !state.initialized,
              child: Column(
                spacing: 8,
                children: [
                  Text(
                    '1 ${formCubit.currentSourceCurrency?.code} to w przeliczeniu',
                    style: context.bodyLarge,
                  ),
                  Text(
                    '${state.currentRate.toStringAsFixed(2)} ${formCubit.currentTargetCurrency?.code}',
                    style: context.headlineLarge,
                  ),
                  Text(
                    state.currentDateTime != null
                        ? DateFormat('d MMM, HH:mm')
                            .format(state.currentDateTime!.toUtc())
                        : BoneMock.date,
                    style: context.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  ReactiveForm(
                    formGroup: formCubit.formGroup,
                    child: const Column(
                      spacing: 20,
                      children: [
                        AmountCurrencyField(
                          amountFormControl: _K.sourceAmount,
                          currencyFormControl: _K.sourceCurrency,
                        ),
                        AmountCurrencyField(
                          amountFormControl: _K.targetAmount,
                          currencyFormControl: _K.targetCurrency,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
