part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.initialized,
    required this.pending,
  });

  factory HomeState.initial() {
    return const HomeState(
      initialized: false,
      pending: false,
    );
  }

  HomeState copyWith({
    bool? initialized,
    bool? pending,
  }) {
    return HomeState(
      initialized: initialized ?? this.initialized,
      pending: pending ?? this.pending,
    );
  }

  final bool initialized;
  final bool pending;

  @override
  List<Object?> get props => [
        initialized,
        pending,
      ];
}
