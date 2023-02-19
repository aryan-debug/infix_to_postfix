class Node {
  dynamic value;
  Node? next;

  Node(this.value, [this.next]);
}

class MyStack {
  Node? head;

  MyStack();

  void push(dynamic value) {
    if (isEmpty()) {
      head = Node(value);
    } else {
      Node last = head!;
      head = Node(value, last);
    }
  }

  dynamic pop() {
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

  void printStack() {
    Node? current = head;
    Node? fakeHead = head;
    while (current != null) {
      print(current.value);
      current = fakeHead?.next;
      fakeHead = fakeHead?.next;
    }
  }

  dynamic peek() {
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
