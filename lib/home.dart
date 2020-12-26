import 'package:flutter/material.dart';
import 'users.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('After Login'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Signout();
            Navigator.pop(context);
          },
          child: Text('Sign out'),
        ),
      ),
    );
  }
}
