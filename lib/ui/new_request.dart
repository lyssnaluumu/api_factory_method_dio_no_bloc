// ignore_for_file: must_be_immutable

import 'package:api_papi/ui/response_screen.dart';
import 'package:flutter/material.dart';

class NewRequest extends StatelessWidget {
  NewRequest({super.key});

  final String firebaseUrl =
      'https://api-papi-e4bb6-default-rtdb.europe-west1.firebasedatabase.app/';

  late String? login;
  late String? password;

  dynamic firebaseGetData() {}

  dynamic firebasePostData() {}

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    void auth() {
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResponseScreen()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  login = value!;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLength: 15,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 15) {
                    return 'Must be between 1 and 15 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: auth, child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
