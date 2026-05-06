import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/di.dart';
import 'package:currency_converter/extensions/text_theme_extension.dart';
import 'package:currency_converter/features/exchangerate/domain/repository/exchangerate_repository.dart';
import 'package:currency_converter/screens/home/cubit/home_cubit.dart';
import 'package:currency_converter/screens/home/widget/currency_converter_form_wgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        repository: inject<ExchangerateRepository>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Currency Converter',
                style: context.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(
                'Check live rates, set rate alerts, receive notifications and more.',
                style: context.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              const CurrencyConverterFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
