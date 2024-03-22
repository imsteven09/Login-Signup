import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:signuplogin/app_images.dart';
import 'package:signuplogin/login.dart';

import 'package:signuplogin/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Sign up and login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String register = '';
  String loggin = '';
  int rescode = 0;
  int rescode1 = 0;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  signup(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {'email': email, 'password': password});
      rescode = response.statusCode;

      if (response.statusCode == 200) {
        setState(() {
          register = 'Registered successfull';
        });
      } else {
        setState(() {
          register = 'unsuccessfull';
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {'email': email, 'password': password});
      rescode1 = response.statusCode;
      if (response.statusCode == 200) {
        print('success');
      } else {
        loggin = 'invalid data';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        signup(emailController.text.toString(),
                            passwordController.text.toString());
                        if (rescode == 200) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return signupp();
                          }));
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Text(register),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        login(_emailController.text.toString(),
                            _passwordController.text.toString());
                        if (rescode1 == 200) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyWidget();
                          }));
                        }
                      },
                      child: Text('login'),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Text(loggin),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return api_images();
                        }));
                      },
                      child: Text('For images Api'))
                ],
              ),
            ),
          ),
        ));
  }
}
