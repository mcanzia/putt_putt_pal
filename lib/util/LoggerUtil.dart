import 'dart:io';
import 'package:logger/logger.dart';

class LoggerUtil {
  // static final Logger _logger = Logger(
  //   printer: PrettyPrinter(),
  //   output: MultiOutput([
  //     ConsoleOutput(),
  //     FileOutput(File('/app/logs/app.log')),
  //   ]),
  // );

  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    output: ConsoleOutput()
  );

  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message) {
    _logger.e(message);
  }
}

class FileOutput extends LogOutput {
  final File file;
  IOSink? sink;

  FileOutput(this.file) {
    try {
    print('Initializing FileOutput with file: ${file.path}');
    file.parent.createSync(recursive: true);
    sink = file.openWrite(mode: FileMode.writeOnlyAppend);
    } catch(error) {
      print('error ${error.toString()}');
    }
  }

  @override
  void output(OutputEvent event) {
    print('Writing to file: ${file.path}');
    sink?.writeAll(event.lines, '\n');
  }

  @override
  Future<void> destroy() async {
    print('Closing file: ${file.path}');
    await sink?.flush();
    await sink?.close();
  }
}
