import 'package:flutter_application_1/my_stack.dart';
import 'package:flutter_application_1/token.dart';

class Evaluator {
  final List<Tokens> tokens;
  Evaluator(this.tokens);
  MyStack<int?> stack = MyStack();

  int add(int a, int b) {
    return a + b;
  }

  int subtract(int a, int b) {
    return a - b;
  }

  int multiply(int a, int b) {
    return a * b;
  }

  int divide(int a, int b) {
    return a ~/ b;
  }

  int evaluate() {
    int i = 0;
    while (i != tokens.length) {
      Tokens token = tokens[i];
      if (token is NumberToken) {
        stack.push(token.value);
      }
      if (token is OpToken) {
        int first = stack.pop()!;
        int second = stack.pop()!;
        int? result;
        if (token.value == "+") {
          result = add(first, second);
        }
        if (token.value == "-") {
          result = subtract(first, second);
        }
        if (token.value == "*") {
          result = multiply(first, second);
        }
        if (token.value == "/") {
          result = divide(first, second);
        }
        stack.push(result);
      }
      i++;
    }
    return stack.pop()!;
  }
}
