import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/environmet.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final client = new SignupClient();

  String? email;
  String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 0, bottom: 45, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/images/logo-app.png'),
                ),
                SizedBox(height: 10),
                Text('User name'),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kGreyShade1,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: kGreyShade1)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'User name is required';
                    }
                    setState(() {
                      username = value;
                    });
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text('Email'),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kGreyShade1,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: kGreyShade1)),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Invalid email, use similar format: mail@email.com";
                    }
                    setState(() {
                      email = value;
                    });
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      client.SignupUser(email!, username!).then((value) => {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(value)),
                            )
                          });
                    }
                  },
                  child: const Text('Signup'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupClient {
  Future<String> SignupUser(String email, String username) async {
    try {
      final uri = Uri.parse(
          '${Environment().config!.schema}://${Environment().config!.authHost}:${Environment().config!.port}/api/user/signup');
      final headers = {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      };
      Map<String, dynamic> body = {
        'email': email,
        'userName': username,
        'phoneNumber': ''
      };

      String jsonBody = json.encode(body);

      final encoding = Encoding.getByName('utf-8');

      Response response = await post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );

      if (response.statusCode == 400) {
        return "User name is used";
      }

      return 'Account created please login';
    } catch (ex) {
      return "Something went wrong ${ex}";
    }
  }
}
