import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static Logger? _logger;

  static void init({bool usePrettyPrinter = false}) {
    _logger = Logger(printer: usePrettyPrinter ? PrettyPrinter() : null);
  }

  static void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger?.d(message, error: error, stackTrace: stackTrace);
    }
  }

  static void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger?.i(message, error: error, stackTrace: stackTrace);
    }
  }

  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger?.e(message, error: error, stackTrace: stackTrace);
    }
  }

  static void warning(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    if (kDebugMode) {
      _logger?.w(message, error: error, stackTrace: stackTrace);
    }
  }

  static void wtf(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    if (kDebugMode) {
      _logger?.f(message, error: error, stackTrace: stackTrace);
    }
  }

  static void verbose(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    if (kDebugMode) {
      _logger?.t(message, error: error, stackTrace: stackTrace);
    }
  }
}
