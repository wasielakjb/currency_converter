extension LetExtension<T> on T? {
  R? let<R>(R? Function(T it) block) => this != null ? block(this as T) : null;

  R letOrElse<R>(R Function(T it) block, {required R orElse}) =>
      this != null ? block(this as T) : orElse;
}
