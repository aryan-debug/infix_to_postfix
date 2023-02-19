class Tokens {
  Object? get precedence => null;
  Object? get value => null;
}

class OpToken extends Tokens {
  static final addToken = OpToken(1, "+");
  static final subtractToken = OpToken(1, "-");
  static final multiplyToken = OpToken(2, "*");
  static final divideToken = OpToken(2, "/");
  final int tokenPrecedence;
  final String tokenValue;

  @override
  int get precedence {
    return tokenPrecedence;
  }

  @override
  String get value {
    return tokenValue;
  }

  @override
  String toString() {
    return "Precedence: $precedence Symbol: $value";
  }

  OpToken(this.tokenPrecedence, this.tokenValue);
}

class OpeningBracket extends Tokens {
  OpeningBracket();
}

class ClosingBracket extends Tokens {
  ClosingBracket();
}

class NumberToken extends Tokens {
  final int numvalue;

  NumberToken(this.numvalue);

  @override
  int get value {
    return numvalue;
  }

  @override
  String toString() {
    return "Value: $value";
  }
}

class EOFToken extends Tokens {
  EOFToken();
}
