extension StringExtension on String {
  String capitalizeFirstLetter() {
    final List<String> conjunctions = [
      'and',
      'but',
      'or',
      'for',
      'nor',
      'so',
      'yet'
    ];

    List<String> words = toLowerCase().split(' ');

    for (int i = 0; i < words.length; i++) {
      if (i == 0 || !conjunctions.contains(words[i])) {
        words[i] = words[i].capitalize();
      }
    }

    return words.join(' ');
  }

  String capitalize() {
    final stringList = split(' ');
    String newString = '';
    for (var val in stringList) {
      newString += "${val[0].toUpperCase()}${val.substring(1)} ";
    }
    return newString;
  }
}
