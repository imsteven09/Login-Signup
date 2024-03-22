import 'package:flutter/material.dart';

class signupp extends StatefulWidget {
  const signupp({super.key});

  @override
  State<signupp> createState() => _signuppState();
}

class _signuppState extends State<signupp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signup'),
        ),
        body: Center(
          child: Text('Signup successfull'),
        ),
      ),
    );
  }
}
