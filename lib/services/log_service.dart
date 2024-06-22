import 'package:logger/logger.dart';

class LogService {
  static final Logger _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(),
  );
  static void d(String msg) {
    _logger.d(msg);
  }

  static void i(String msg) {
    _logger.i(msg);
  }

  static void w(String msg) {
    _logger.w(msg);
  }

  static void e(String msg) {
    _logger.e(msg);
  }
}
