import 'token.dart';
import 'util.dart';

class Tokenizer {
  String equation = "";
  int current = 0;
  List<Tokens> tokens = [];

  Tokenizer(this.equation);

  tokenize() {
    while (current != equation.length) {
      switch (equation[current]) {
        case "+":
          tokens.add(OpToken.addToken);
          break;
        case "-":
          tokens.add(OpToken.subtractToken);
          break;
        case "*":
          tokens.add(OpToken.multiplyToken);
          break;
        case "/":
          tokens.add(OpToken.divideToken);
          break;
        case "(":
          tokens.add(OpeningBracket());
          break;
        case ")":
          tokens.add(ClosingBracket());
          break;
      }
      if (isNumeric(equation[current])) parseInt();
      current++;
    }
    tokens.add(EOFToken());
    return tokens;
  }

  parseInt() {
    String result = "";
    while (isNumeric(equation[current])) {
      result += equation[current];
      current++;
      if (current == equation.length) {
        break;
      }
    }
    tokens.add(NumberToken(int.parse(result)));
    current--;
  }

  printTokens() {
    for (var token in tokens) {
      print(token);
    }
  }
}
