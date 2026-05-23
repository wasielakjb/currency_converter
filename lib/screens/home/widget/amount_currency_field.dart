import 'package:currency_converter/extensions/color_scheme_extension.dart';
import 'package:currency_converter/screens/home/widget/amount_form_field.dart';
import 'package:currency_converter/screens/home/widget/currency_form_field.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AmountCurrencyField extends StatelessWidget {
  const AmountCurrencyField({
    required this.amountFormControl,
    required this.currencyFormControl,
    super.key,
  });

  final String amountFormControl;
  final String currencyFormControl;

  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.surfaceContainer,
        ),
      ),
      child: InputDecorator(
        decoration: const InputDecoration(),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: AmountFormField(
                  formControlName: amountFormControl,
                ),
              ),
              const VerticalDivider(thickness: 1, width: 20),
              Expanded(
                flex: 2,
                child: CurrencyFormField(
                  formControlName: currencyFormControl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
