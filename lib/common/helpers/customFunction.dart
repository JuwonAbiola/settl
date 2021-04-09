import 'package:intl/intl.dart';

final currencyFormat = new NumberFormat("#,##0.00", "en_US");

extension customStringExtension on String {
  toTitleCase() {
    final words = this.toLowerCase().split(' ');
    var newWord = '';
    for (var word in words) {
      word.isNotEmpty
          ? newWord += '${word[0].toUpperCase()}${word.substring(1)} '
          : null;
    }

    return newWord;
  }

  getInitials() {
    List<String> names = this.trim().split(" ");

    String initials = "";
    int numWords = names.length;

    if (numWords < names.length) {
      numWords = names.length;
    }
    for (var i = 0; i < numWords; i++) {
      initials += '${names[i][0]}';
    }
    return '${initials[0].toUpperCase()}${initials[initials.length - 1].toUpperCase()}';
  }

  getSingleInitial() {
    return this.split('')[0].toUpperCase();
  }

  sanitizeToDouble() {
    return double.tryParse(this.replaceAll(",", ""));
  }
}

extension customDoubleExtension on double {
  formatCurrency({String currencySymbol = '₦'}) {
    return this == null
        ? '-'
        : ((currencySymbol != null ? (currencySymbol + ' ') : '') +
            currencyFormat.format(this));
  }
}
