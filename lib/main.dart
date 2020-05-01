import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_list_sample/users.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Users>(create: (context) => Users()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Users users = Provider.of<Users>(context, listen: false);
              users
                  .addUser(User('User${users.list.length}'));
            }),
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context);
    return ListView(
      children: users.list
          .map((user) => ListTile(
              leading: Text(user.counter.toString()), title: Text(user.name),trailing: IconButton(icon: Icon(Icons.add), onPressed: () {
                user.increment();
                //users.notify();
              }),))
          .toList(),
    );
  }
}
