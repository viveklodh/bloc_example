import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String? email;
  HomePage(this.email, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: Text(email!),
    );
  }
}
