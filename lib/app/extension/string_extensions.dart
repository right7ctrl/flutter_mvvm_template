extension StringExtensions on String? {
  String get getValueOrDefault {
    return this ?? "";
  }

  bool isEmail() {
    String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return RegExp(emailPattern).hasMatch(getValueOrDefault);
  }

  bool isPhone() {
    String phonePattern = r'(^5[0-9]{9}$)';
    if (getValueOrDefault.length == 11) {
      var newNumber = getValueOrDefault.replaceFirst(getValueOrDefault[0], "");
      return RegExp(phonePattern).hasMatch(newNumber);
    }
    return RegExp(phonePattern).hasMatch(getValueOrDefault);
  }

  bool containsSymbol() {
    String symbolPattern = r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' "'" ']';
    return RegExp(symbolPattern).hasMatch(getValueOrDefault);
  }

  bool containsNumber() {
    String symbolPattern = r'[0-9]';
    return RegExp(symbolPattern).hasMatch(getValueOrDefault);
  }

  String replaceNewLineCharacter() {
    return getValueOrDefault.replaceAll('\\n', '\n');
  }

  String replaceSpacesToNewLineCharacter() {
    return getValueOrDefault.replaceAll(' ', '\n');
  }

  String toPhoneFormat() {
    if (getValueOrDefault.length == 10) {
      return "(${getValueOrDefault.substring(0, 3)}) ${getValueOrDefault.substring(3, 6)} ${getValueOrDefault.substring(6)}";
    }
    return getValueOrDefault;
  }
}
