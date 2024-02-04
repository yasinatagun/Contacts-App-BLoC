// ignore_for_file: non_constant_identifier_names

import 'package:contacts_bloc_app/constants/colors.dart';
import 'package:contacts_bloc_app/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var tfName = TextEditingController();
  var tfPhone = TextEditingController();

  Future<void> register(String person_name, String person_phone) async {
    debugPrint("Person name: $person_name, Person Phone: $person_phone");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackground,
      appBar: AppBar(
        backgroundColor: appBarBackground,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        title: const Text("Register Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 0,
                color: secondaryBackground,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: TextField(
                    controller: tfName,
                    maxLength: 13,
                    decoration: const InputDecoration(
                      counterText: '',
                      hintText: "Person Name",
                      hintStyle: TextStyle(color: Color(0xff2E2E2E)),
                      border: InputBorder.none, 
                      contentPadding: EdgeInsets.all(20),

                      suffixIcon: Icon(Icons.person),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2E2E2E), 
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 0,
                color: secondaryBackground,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: TextField(
                    controller: tfPhone,
                    maxLength: 13,
                    decoration: const InputDecoration(
                      counterText: '',
                      hintText: "Person Phone",
                      hintStyle: TextStyle(color: Color(0xff2E2E2E)),
                      border: InputBorder.none, 
                      contentPadding: EdgeInsets.all(20),

                      suffixIcon: Icon(Icons.phone),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2E2E2E), 
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<RegisterCubit>()
                      .register(tfName.text, tfPhone.text);
                      Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfffff3e1),
                  foregroundColor: textColor,
                  elevation: 0,
                  minimumSize: const Size(200, 60),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
