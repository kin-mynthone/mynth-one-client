extension ExceptionMessage on Exception {
  String get message {
    if (toString().startsWith('Exception: ')) {
      const indexWhereToCut = 11;
      return toString().substring(indexWhereToCut);
    } else {
      return toString();
    }
  }
}
