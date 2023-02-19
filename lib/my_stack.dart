import 'package:flutter_application_1/token.dart';

class Node {
  Tokens value;
  Node? next;

  Node(this.value, [this.next]);
}

class MyStack {
  Node? head;

  MyStack();

  void push(Tokens value) {
    if (isEmpty()) {
      head = Node(value);
    } else {
      Node last = head!;
      head = Node(value, last);
    }
  }

  Tokens? pop() {
    if (isEmpty()) {
      return null;
    }
    Node currentHead = head!;
    head = head!.next;
    return currentHead.value;
  }

  bool isEmpty() {
    return size() == 0;
  }

  @override
  String toString() {
    String result = "";
    Node? current = head;
    Node? fakeHead = head;
    while (current != null) {
      result += current.value.toString() + "\n";
      current = fakeHead?.next;
      fakeHead = fakeHead?.next;
    }
    return result;
  }

  Tokens? peek() {
    return head?.value;
  }

  int size() {
    Node? current = head;
    Node? fakeHead = head;
    int count = 0;
    while (current != null) {
      count++;
      current = fakeHead?.next;
      fakeHead = fakeHead?.next;
    }
    return count;
  }
}
