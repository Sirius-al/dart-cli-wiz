import 'package:cli_wiz/cli_wiz.dart';

void main() {
  var terminal = new Terminal();
  terminal.clearScreen();
  // String collectedData = terminal.collectInput();
  // print('< $collectedData > was inserted');

    List<Option> options = [
      new Option('What does a cat loves to eat ?', ['meat', 'milk', 'fish'], 2),
      new Option('Why does a dog called to a man\'s best friend ?', ['loyal', 'they are domestic', 'they always wants to play'], 0),
      new Option('Which one is the smallest bird ?', ['cockatiel', 'humming-bird', 'tuntuni'], 1),
    ];

    List<Mcq> mcqs = [
      new Mcq('Name an animal that lives in water, but does not lay eggs !', ['whale', 'shark', 'dolphine']),
      new Mcq('How many days are there in a leap year ?', ['364']),
      new Mcq('Name a loyal animal !', ['dog', 'cow']),
    ];


  terminal.chooseTypeOfQuestion(options, mcqs);
}
