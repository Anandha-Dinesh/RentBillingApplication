import 'package:flutter/material.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameFormController = TextEditingController();
  final TextEditingController _phoneFormController = TextEditingController();
  final TextEditingController _rentFormController = TextEditingController();
  final TextEditingController _ebFormController = TextEditingController();
  final TextEditingController _lastReadingFormController =
      TextEditingController();
  final TextEditingController _miscellaneousFormController =
      TextEditingController();

  @override
  void _dispose() {
    _nameFormController.dispose();
    _phoneFormController.dispose();
    _rentFormController.dispose();
    _ebFormController.dispose();
    _lastReadingFormController.dispose();
    _miscellaneousFormController.dispose();
    super.dispose();
  }

  void _clearFormFields() {
    _formKey.currentState!.reset();
    _nameFormController.clear();
    _phoneFormController.clear();
    _rentFormController.clear();
    _ebFormController.clear();
    _lastReadingFormController.clear();
    _miscellaneousFormController.clear();
  }

  void validateData() {
    if (_nameFormController.text.isNotEmpty &&
        _phoneFormController.text.isNotEmpty &&
        _rentFormController.text.isNotEmpty &&
        _ebFormController.text.isNotEmpty &&
        _lastReadingFormController.text.isNotEmpty &&
        _miscellaneousFormController.text.isNotEmpty) {
      //send data to backend
    } else {
      _nameFormController.text = "";
      _phoneFormController.text = "";
      _rentFormController.text = "";
      _ebFormController.text = "";
      _lastReadingFormController.text = "";
      _miscellaneousFormController.text = "";
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                  controller: _nameFormController,
                ),
                const Text("Phone :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                  controller: _phoneFormController,
                ),
                const Text("Rent :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                  controller: _rentFormController,
                ),
                const Text("Amount/Unit :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                  controller: _ebFormController,
                ),
                const Text("Last Reading :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                  controller: _lastReadingFormController,
                ),
                const Text("Miscellaneous :"),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter some data";
                    } else {
                      return null;
                    }
                  },
                  controller: _miscellaneousFormController,
                ),
                Center(
                  child: SizedBox(
                    width: 80,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        _clearFormFields();
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
                        validateData();
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
