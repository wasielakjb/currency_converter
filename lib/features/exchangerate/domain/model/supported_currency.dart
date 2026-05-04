import 'package:equatable/equatable.dart';

class SupportedCurrency extends Equatable {
  const SupportedCurrency({
    required this.code,
    required this.name,
  });

  final String code;
  final String name;

  @override
  List<Object?> get props => [code, name];
}
