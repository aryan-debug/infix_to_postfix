import 'package:flutter/material.dart';
import 'package:flutter_application_1/tokenizer.dart';
import 'my_stack.dart';
import 'util.dart';

List<String> operators = ["+", "-", "*", "/"];

int? getPrecedence(String char) {
  if (char == "+") {
    return 1;
  }
  if (char == "-") {
    return 1;
  }
  if (char == "*") {
    return 2;
  }
  if (char == "/") {
    return 2;
  }
}

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

  void getInput() {
    String input = myController.text;
    String postfix = "";
    MyStack stack = MyStack();
    int i = 0;
    Tokenizer tokenizer = Tokenizer(input);
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
          Text(notation, style: const TextStyle(fontSize: 25))
        ]),
      ),
    );
  }
}
