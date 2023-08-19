class FirstLetterName {
  static String getFirstLetterName(String text) {
    final words = text.split(' ');
    final firstLetters = [];
    for (var word in words) {
      if (word.isNotEmpty) {
        firstLetters.add(word[0].toUpperCase());
      }
    }
    final result = firstLetters.join('');
    return result;
  }
}
