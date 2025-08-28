import 'dart:math';

class RandomString {
  static final _random = Random();
  static final _characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  static String generate(int length) {
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _characters.codeUnitAt(_random.nextInt(_characters.length)),
      ),
    );
  }
}
