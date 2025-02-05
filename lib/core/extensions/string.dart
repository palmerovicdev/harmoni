extension DigitsOnly on String {
  bool get isDigitsOnly => RegExp(r'^[0-9]+$').hasMatch(this);
}

extension LettersOnlyAndFistCharacterUpperCase on String {
  bool get isLettersOnlyAndFistCharacterUpperCase => RegExp(r'^[A-Za-z]+$').hasMatch(this);
}

extension EmailOnly on String {
  bool get isEmailOnly => RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);
}

extension SnakeCaseString on String {
  String toSnakeCase() {
    final wordsList = split(' ');
    List<String> words = wordsList.map((word) => word.toLowerCase()).toList();
    return words.join('_');
  }
}

extension UpperSnakeCase on String {
  String toUpperSnakeCase() => toSnakeCase().toUpperCase();
}

extension ValidLink on String {
  bool get isValidLink => RegExp(r'^(https?://)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6}(/[^\s?#]*)?(\?[^\s#]*)?(#\S*)?$').hasMatch(this);
}