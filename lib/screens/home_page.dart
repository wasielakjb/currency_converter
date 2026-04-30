import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            ],
          ),
        ),
      ),
    );
  }
}
