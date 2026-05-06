import 'package:reactive_forms/reactive_forms.dart';

extension AbstractControlX<T> on AbstractControl<T> {
  FormGroup asFormGroup() {
    return this as FormGroup;
  }
}

extension FormGroupX on FormGroup {
  AbstractControl<T>? maybeControl<T>(String name) {
    return containsX(name) ? controlX<T>(name) : null;
  }

  AbstractControl<T> controlX<T>(String name) {
    return control(name) as AbstractControl<T>;
  }

  T? controlVal<T>(String name) {
    return maybeControl<T>(name)?.value;
  }

  bool containsX(String name) {
    final fragments = name.split('.');
    if (fragments.length == 1) return contains(name);

    try {
      final nameWithoutLastFragment =
          fragments.sublist(0, fragments.length - 1).join('.');
      final fg = control(nameWithoutLastFragment).asFormGroup();
      return fg.contains(fragments.last);
    } on FormControlNotFoundException {
      return false;
    }
  }
}
