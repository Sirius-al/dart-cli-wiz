// import 'dart:io' as io;
import 'dart:io';

class Terminal {
  Terminal() {
    // print("Terminal class initialized !");
  }

  void printPrompt(String prompt) {
    stdout.write('$prompt \n');
  }

  void clearScreen() {
    // var os = Platform.environment;
    var os = Platform.operatingSystem;
    var proc = Platform.numberOfProcessors;

    if (Platform.isWindows) {
      stdout.write('\x1B[2J\x1B[0f');
    } else {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }

    stdout.write('os is $os and $proc numbers of processors' '\n');
  }

  String collectInput() {
    return stdin.readLineSync();
  }
}
