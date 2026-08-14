import 'dart:developer' as dev;

///
/// find more colors [here](https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797)
enum LoggerUtils {
  black('30'),
  red('31'),
  green('32'),
  yellow('33'),
  blue('34'),
  magenta('35'),
  cyan('36'),
  white('37');

  final String code;
  const LoggerUtils(this.code);

  static String _colorizeText(String colorCode, dynamic text) =>
      '\x1B[${colorCode}m$text\x1B[0m';

  void log(dynamic text) => dev.log(_colorizeText(code, text));

  static void logError(dynamic text) =>
      dev.log('\x1B[31m$text\x1B[0m');
  // static void logWarning(dynamic text) => dev.log('\x1B[33m$text\x1B[0m');
  static void logSuccess(dynamic text) =>
      dev.log('\x1B[32m$text\x1B[0m');
  static void logInfo(dynamic text) =>
      dev.log('\x1B[34m$text\x1B[0m');

  static void logWarning(dynamic text) =>
      dev.log(_colorizeText(LoggerUtils.yellow.code, text));
}
