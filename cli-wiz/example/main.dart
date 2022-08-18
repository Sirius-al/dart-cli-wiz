import 'package:cli_wiz/src/terminal.dart';

void main() {
  var terminal = new Terminal();
  terminal.clearScreen();
  terminal.printPrompt('bhalo acho naki ?');
  String collectedData = terminal.collectInput();
  print('< $collectedData > was inserted');
}
