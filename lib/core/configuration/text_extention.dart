import 'dart:developer';

extension PrintHelper on String {
  void get printConsole => log(this);
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}
