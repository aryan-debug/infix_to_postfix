import 'package:flutter/material.dart';
import 'package:flutter_application_1/evaluate.dart';
import 'package:flutter_application_1/notation_converter.dart';
import 'package:flutter_application_1/token.dart';
import 'package:flutter_application_1/tokenizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  String notation = "";
  String result = "";

  void getInput() {
    String input = myController.text;
    String postfix = "";
    int i = 0;
    Tokenizer tokenizer = Tokenizer(input);
    PostfixConverter pc = PostfixConverter(tokenizer.tokenize());
    List<Tokens> postfix_tokens = pc.convert();
    for (var token in postfix_tokens) {
      String tokenValue = token.value.toString();
      postfix += " $tokenValue ";
    }
    Evaluator ev = Evaluator(postfix_tokens);

    setState(() {
      notation = postfix;
      result = ev.evaluate().toString();
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          Form(
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 350,
                    child: Column(children: [
                      TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter an equation in infix notation",
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () => getInput(),
                          child: const Text("Infix to Postfix"))
                    ]),
                  ))),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Postfix Notation: ",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 15),
                Text(notation, style: const TextStyle(fontSize: 25))
              ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 30),
            Text("Result: $result", style: const TextStyle(fontSize: 25))
          ])
        ]),
      ),
    );
  }
}
