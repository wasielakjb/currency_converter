part of 'converter_form_cubit.dart';

class ConverterFormState extends Equatable {
  factory ConverterFormState.initial() {
    return const ConverterFormState._(
      initialized: false,
      pending: false,
      currentRate: 0,
      currentDateTime: null,
    );
  }
  const ConverterFormState._({
    required this.initialized,
    required this.pending,
    required this.currentRate,
    required this.currentDateTime,
  });

  final bool initialized;
  final bool pending;
  final double currentRate;
  final DateTime? currentDateTime;

  ConverterFormState copyWith({
    bool? initialized,
    bool? pending,
    double? currentRate,
    DateTime? currentDateTime,
  }) {
    return ConverterFormState._(
      initialized: initialized ?? this.initialized,
      pending: pending ?? this.pending,
      currentRate: currentRate ?? this.currentRate,
      currentDateTime: currentDateTime ?? this.currentDateTime,
    );
  }

  @override
  List<Object?> get props => [
        initialized,
        pending,
        currentRate,
        currentDateTime,
      ];
}

class FormChange {
  FormChange(List<Json> values)
      : previous = Map.unmodifiable(values.first),
        current = Map.unmodifiable(values.last);

  final Json previous;
  final Json current;

  FormValueChange<T> get<T>(String controlName) {
    final previousVal = previous.recursiveVal(controlName) as T?;
    final currentVal = current.recursiveVal(controlName) as T?;
    return FormValueChange<T>(previousVal, currentVal);
  }
}

class FormValueChange<T> {
  FormValueChange(this.previous, this.current);

  final T? previous;
  final T? current;

  bool get changed => previous != current;
}
