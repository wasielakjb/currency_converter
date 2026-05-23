import 'package:currency_converter/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AmountFormField extends StatelessWidget {
  const AmountFormField({
    required this.formControlName,
    super.key,
  });

  final String formControlName;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<double>(
      formControlName: formControlName,
      valueAccessor: _DoubleValueAccessor(),
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isDense: true,
        labelStyle: context.bodyMedium,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d+([.,]\d{0,2})?'),
        ),
      ],
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
    );
  }
}

class _DoubleValueAccessor extends ControlValueAccessor<double, String> {
  @override
  String? modelToViewValue(double? modelValue) {
    if (modelValue == null) return '';
    return modelValue.toStringAsFixed(2).replaceAll('.', ',');
  }

  @override
  double? viewToModelValue(String? viewValue) {
    if (viewValue == null || viewValue.isEmpty) return null;

    final normalized = viewValue.replaceAll(',', '.');
    return double.tryParse(normalized);
  }
}
