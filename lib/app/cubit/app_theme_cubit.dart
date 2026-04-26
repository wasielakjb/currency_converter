import 'package:currency_converter/extensions/json.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppThemeCubit extends HydratedCubit<ThemeMode> {
  AppThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode theme) {
    if (state == theme) return;
    emit(theme);
  }

  @override
  ThemeMode? fromJson(Json json) =>
      json['theme'] != null ? ThemeMode.values[json['theme'] as int] : null;

  @override
  Json? toJson(ThemeMode state) => {'theme': state.index};
}
