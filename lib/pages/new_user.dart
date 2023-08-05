import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewUser extends StatefulWidget {
  const NewUser({super.key, required this.userId});
  final String userId;

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameFormController = TextEditingController();
  final TextEditingController _emailFormController = TextEditingController();
  final TextEditingController _phoneFormController = TextEditingController();
  final TextEditingController _rentFormController = TextEditingController();
  final TextEditingController _ebFormController = TextEditingController();
  final TextEditingController _lastReadingFormController =
      TextEditingController();
  final TextEditingController _miscellaneousFormController =
      TextEditingController();

  _addUsers(
    name,
    email,
    phone,
    rent,
    ebcharge,
    lastreading,
    miscellaneous,
  ) async {
    final url = Uri.http(dotenv.env['URL'].toString(), '/api/addRenter');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': "application/json"},
        body: json.encode(
          {
            "renter_name": name,
            "email": email,
            "phonenumber": phone,
            "landlord_id": widget.userId,
            "rent": rent,
            "EBcharge": ebcharge,
            "currentReading": lastreading,
            "miscellaneous": miscellaneous
          },
        ),
      );
      if (response.statusCode == 20) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
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
          "New User",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: GridView.count(
              scrollDirection: Axis.vertical,
              childAspectRatio: (size.width / 170),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              children: [
                const Text("Name :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  controller: _nameFormController,
                  validator: (value) {
                    if (_nameFormController.text.isEmpty) {
                      return "Please enter some name";
                    } else {
                      return null;
                    }
                  },
                ),
                const Text("Phone :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  controller: _phoneFormController,
                  validator: (value) {
                    if (_phoneFormController.text.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                ),
                const Text("Email :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  controller: _emailFormController,
                  validator: (value) {
                    if (_emailFormController.text.isEmpty) {
                      return "Please Enter some Email";
                    } else {
                      return null;
                    }
                  },
                ),
                const Text("Rent :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  controller: _rentFormController,
                  validator: (value) {
                    if (_rentFormController.text.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                ),
                const Text("Amount/Unit :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  controller: _ebFormController,
                  validator: (value) {
                    if (_ebFormController.text.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                ),
                const Text("Last Reading :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  controller: _lastReadingFormController,
                  validator: (value) {
                    if (_lastReadingFormController.text.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                ),
                const Text("Miscellaneous :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  controller: _miscellaneousFormController,
                  validator: (value) {
                    if (_miscellaneousFormController.text.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                ),
                Center(
                  child: SizedBox(
                    width: 80,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: const Text(
                        "Reset",
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 80,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _addUsers(
                            _nameFormController.text,
                            _emailFormController.text,
                            _phoneFormController.text,
                            _rentFormController.text,
                            _ebFormController.text,
                            _lastReadingFormController.text,
                            _miscellaneousFormController.text,
                          );
                        }
                      },
                      child: const Text(
                        "ADD",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
