import 'package:currency_converter/screens/home/cubit/home_cubit.dart';
import 'package:currency_converter/screens/home/widget/amount_text_field.dart';
import 'package:currency_converter/screens/home/widget/currency_form_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CurrencyConverterFormWidget extends StatelessWidget {
  const CurrencyConverterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formCubit = context.watch<HomeCubit>();
    return ReactiveForm(
      formGroup: formCubit.formGroup,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (!state.initialized) return const SizedBox();
          return const Column(
            spacing: 24,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CurrencyFormSelector(formControlName: 'from'),
                  ),
                  Expanded(
                    flex: 3,
                    child: AmountTextField(formControlName: 'from_amount'),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CurrencyFormSelector(formControlName: 'to'),
                  ),
                  Expanded(
                    flex: 3,
                    child: AmountTextField(
                      formControlName: 'to_amount',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
