import 'package:flutter_application_1/my_stack.dart';
import 'package:flutter_application_1/token.dart';

class PostfixConverter {
  List<Tokens> tokens;
  PostfixConverter(this.tokens);

  convert() {
    MyStack stack = MyStack();
    int current = 0;
    List<Tokens> postfix = [];
    while (tokens[current] is! EOFToken) {
      Tokens currentToken = tokens[current];
      if (currentToken is NumberToken) {
        postfix.add(currentToken);
      } else {
        if (stack.isEmpty() || stack.peek() is OpeningBracket) {
          stack.push(currentToken);
        } else if (currentToken is OpeningBracket) {
          stack.push(currentToken);
        } else if (currentToken is ClosingBracket) {
          print(stack);
          Tokens tk = currentToken;
          while (stack.peek() is! OpeningBracket) {
            tk = stack.pop()!;
            postfix.add(tk);
          }
          stack.pop();
        } else if (currentToken.precedence! as int >
            (stack.peek()!.precedence as int)) {
          stack.push(currentToken);
        } else if (currentToken.precedence! as int <
            (stack.peek()!.precedence as int)) {
          Tokens tk = currentToken;
          while (!stack.isEmpty() &&
              tk.precedence as int < (stack.peek()!.precedence as int)) {
            tk = stack.pop()!;
            postfix.add(tk);
          }
          stack.push(currentToken);
        } else if (currentToken.precedence! as int ==
            (stack.peek()!.precedence as int)) {
          postfix.add(stack.pop()!);
          stack.push(currentToken);
        }
      }
      current++;
    }
    while (!stack.isEmpty()) {
      postfix.add(stack.pop()!);
    }
    print(postfix);
  }
}
