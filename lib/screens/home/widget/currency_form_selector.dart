import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/di.dart';
import 'package:currency_converter/extensions/color_scheme_extension.dart';
import 'package:currency_converter/extensions/text_theme_extension.dart';
import 'package:currency_converter/features/exchangerate/domain/model/supported_currency.dart';
import 'package:currency_converter/features/exchangerate/domain/repository/exchangerate_repository.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CurrencyFormSelector extends StatelessWidget {
  const CurrencyFormSelector({
    required this.formControlName,
    super.key,
  });

  final String formControlName;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<SupportedCurrency, SupportedCurrency>(
      formControlName: formControlName,
      builder: (field) => InkWell(
        onTap: () async {
          final res = await CurrencyBottomSheet.show(context, field.value);
          if (res != null && res != field.value) {
            field.didChange(res);
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(field.value?.code ?? '', style: context.titleLarge),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyBottomSheet extends StatefulWidget {
  const CurrencyBottomSheet({
    required this.repository,
    required this.current,
    super.key,
  });

  final ExchangerateRepository repository;
  final SupportedCurrency? current;

  static Future<SupportedCurrency?> show(
    BuildContext context,
    SupportedCurrency? current,
  ) async {
    return showModalBottomSheet<SupportedCurrency?>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (_) => SafeArea(
        child: CurrencyBottomSheet(
          repository: inject<ExchangerateRepository>(),
          current: current,
        ),
      ),
    );
  }

  @override
  State<CurrencyBottomSheet> createState() => _CurrencyBottomSheetState();
}

class _CurrencyBottomSheetState extends State<CurrencyBottomSheet> {
  List<SupportedCurrency>? items;

  @override
  void initState() {
    super.initState();
    initSupportedCodes();
  }

  Future<void> initSupportedCodes() async {
    items = await widget.repository.getSupportedCodes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: items == null,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: items?.length ?? 5,
        itemBuilder: (context, index) {
          final item = items?[index];
          return ListTile(
            onTap: () => context.maybePop(item),
            selected: item == widget.current,
            title: Text(item?.code ?? BoneMock.title),
            subtitle: Text(item?.name ?? BoneMock.subtitle),
            selectedTileColor: items != null ? context.primaryContainer : null,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 4),
      ),
    );
  }
}
