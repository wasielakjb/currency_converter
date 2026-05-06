import 'package:currency_converter/extensions/color_scheme_extension.dart';
import 'package:currency_converter/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({
    required this.formControlName,
    this.readOnly = false,
    super.key,
  });

  final String formControlName;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<double>(
      formControlName: formControlName,
      readOnly: readOnly,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        hintText: readOnly ? null : 'Enter amount',
        hintStyle: context.bodyLarge.copyWith(
          color: context.onSurface.withValues(alpha: 0.6),
        ),
      ),
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
    );
  }
}
