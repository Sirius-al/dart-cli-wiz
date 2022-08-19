// import 'dart:io' as io;
import 'dart:core';
import 'dart:io';
import 'option.dart';
import 'mcq.dart';

class Terminal {
  Terminal() {
    // print("Terminal class initialized !");
  }

  void printOptions(List<Option> opts) {
    for (var i = 0; i < opts.length; i++) {
      var opt = opts[i];

      stdout.writeln('[$i]- ${opt.label}');

      for (var x = 0; x < opt.options.length; x++) {
        var mcq = opt.options[x];
        stdout.writeln('--- ${x} ${mcq}');
      }
      stdout.write('\n');
      stdout.write('Choose the correct Answer ! (only numbers)');
      stdout.write('\n');

      int inputtedAns;

      try {
        inputtedAns = int.parse(this.collectInput());
      } catch (e) {
        stdout.write(
            '-------------------------------- RESTART -------------------------------- \n');
        return printOptions(opts);
      }

      if (opt.correctAns == inputtedAns) {
        print('$i is correct !');
      } else {
        print('$inputtedAns is wrong answer ! \n');
      }
    }
  }

  void printMcqs(List<Mcq> opts) {
    for (var i = 0; i < opts.length; i++) {
      var opt = opts[i];

      stdout.writeln('[$i]- ${opt.label}');

      String ans = this.collectInput();

      if (opt.ans.contains(ans.toLowerCase())) {
        stdout.writeln("Correct");

      } else {
        stdout.writeln("Wrong ! the correct ans is ${opt.ans}");

      }
    }
  }

  chooseTypeOfQuestion(List<Option> opts, List<Mcq> mcqs) {
    stdout.writeln('would you like to get options before mcqs ? ( y / n ) ');
    String ans = collectInput();

    if (ans.contains('y')) {
      printOptions(opts);
      printMcqs(mcqs);
      
    } else if (ans.contains('n')) {
      printMcqs(mcqs);
      printOptions(opts);

    } else {

      print('Donno which one to show ! \n');
    }
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
    stdout.write('>');
    return stdin.readLineSync()!;
  }
}
