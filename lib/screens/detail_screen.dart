// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:contacts_bloc_app/constants/colors.dart';
import 'package:contacts_bloc_app/cubit/detail_cubit.dart';
import 'package:flutter/material.dart';

import 'package:contacts_bloc_app/models/person.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final Person person;
  const DetailScreen({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var tfName = TextEditingController();
  var tfPhone = TextEditingController();

  Future<void> initPerson() async {
    var person = widget.person;
    tfName.text = person.person_name;
    tfPhone.text = person.person_phone;
  }

  @override
  void initState() {
    super.initState();
    initPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackground,
      appBar: AppBar(
        backgroundColor: appBarBackground,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        title: const Text("Deatail Screen"),
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
                    maxLength: 20,
                    decoration: const InputDecoration(
                      hintText: "Person Name",
                      counterText: '',

                      hintStyle: TextStyle(color: Color(0xff2E2E2E)),
                      border: InputBorder.none, 
                      contentPadding: EdgeInsets.all(20),

                      suffixIcon: Icon(Icons.edit),
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

                      suffixIcon: Icon(Icons.edit),
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
                  var person = widget.person;
                  context
                      .read<DetailCubit>()
                      .update(person.person_id,tfName.text, tfPhone.text);
                      Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryBackground,
                  foregroundColor: textColor,
                  elevation: 0,
                  minimumSize: const Size(200, 60),
                ),
                child: const Text(
                  "Update",
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
