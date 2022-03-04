
import 'dart:core';

/// Throws a [NullThrownError] if the given [reference] is `null`.
T checkNotNull<T>(T reference, [ String? message]) {
  if (reference == null) {
    if (message != null) throw StateError(message);
    if (reference == null) throw NullThrownError();
  }
  return reference;
}