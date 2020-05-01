import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier {
  Users();
  List<User> list = [];

  void notify() {
    notifyListeners();
  }

  void addUser(User user) {
    list.add(user);
    notifyListeners();
  }
}

class User {
  String name;
  int counter = 0;
  User(this.name);

  void increment() {
    counter++;
  }
}
