import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  _signInRequest(email, pass, context) async {
    final url = Uri.http(dotenv.env['URL'].toString(), "/api/signin");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'email': email,
            'password': pass,
          },
        ),
      );

      if (response.statusCode == 200) {
        Navigator.popAndPushNamed(
          context,
          "/home",
          arguments: response.body,
        );
      } else {
        _formKey.currentState!.reset();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 26),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SizedBox(
          height: size.height - 20,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      controller: _emailTextController,
                      validator: (value) {
                        if (_emailTextController.text.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      controller: _passwordTextController,
                      validator: (value) {
                        if (_passwordTextController.text.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _signInRequest(_emailTextController.text,
                              _passwordTextController.text, context);
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 16.0),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();
  final TextEditingController _confirmPassTextController =
      TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _numberTextController = TextEditingController();

  _requestSignUp(email, name, number, password, repassword, context) async {
    final url = Uri.http(dotenv.env['URL'].toString(), "/api/register");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "username": name,
            "email": email,
            "phonenumber": number,
            "password": password,
            "repassword": repassword,
          },
        ),
      );
      print(response.body);
      if (response.statusCode == 200) {
        Navigator.popAndPushNamed(context, "/home");
      } else {
        _formKey.currentState!.reset();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 26),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SizedBox(
          height: size.height - 20,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    controller: _emailTextController,
                    validator: (value) {
                      if (_emailTextController.text.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    controller: _nameTextController,
                    validator: (value) {
                      if (_nameTextController.text.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone number',
                    ),
                    controller: _numberTextController,
                    validator: (value) {
                      if (_numberTextController.text.isEmpty) {
                        return 'Please enter your number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    controller: _passTextController,
                    validator: (value) {
                      if (_passTextController.text.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    controller: _confirmPassTextController,
                    validator: (value) {
                      if (_confirmPassTextController.text.isEmpty) {
                        return 'Please confirm your password';
                      } else if (_passTextController ==
                          _confirmPassTextController) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print(_numberTextController.text);

                        _requestSignUp(
                          _emailTextController.text,
                          _nameTextController.text,
                          _numberTextController.text,
                          _passTextController.text,
                          _confirmPassTextController.text,
                          context,
                        );
                      }
                    },
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
