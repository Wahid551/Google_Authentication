import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:googleauthentication/home.dart';
import 'users.dart';

final firestore = Firestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
      },
      home: Googlepage(),
    );
  }
}

class Googlepage extends StatefulWidget {
  @override
  _GooglepageState createState() => _GooglepageState();
}

class _GooglepageState extends State<Googlepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In With Google'),
      ),
      body: Center(
        child: GoogleSignInButton(
          darkMode: true,
          onPressed: () {
            SignInWithGoogle().then((value) {
              firestore
                  .collection('users')
                  .document('auth')
                  .collection('gusers')
                  .add({'name': name, 'image': imageUrl, 'email': email});
            }).catchError((e) {
              print(e);
            }).then((value) {
              Navigator.pushNamed(context, '/home');
            }).catchError((e) {
              print(e);
            });
          },
        ),
      ),
    );
  }
}
