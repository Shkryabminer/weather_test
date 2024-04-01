extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }

  Iterable<T>? whereOrNull(bool Function(T) test) {
    final filtered = where(test);
    return filtered.isNotEmpty ? filtered : null;
  }
}
