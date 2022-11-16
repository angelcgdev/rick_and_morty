String capitalizeAllWords(String str) {
  String result = str[0].toUpperCase();
  for (int i = 1; i < str.length; i++) {
    if (str[i - 1] == " ") {
      result = result + str[i].toUpperCase();
    } else {
      result = result + str[i].toLowerCase();
    }
  }
  return result;
}
