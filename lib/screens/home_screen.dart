import 'package:contacts_bloc_app/cubit/home_cubit.dart';
import 'package:contacts_bloc_app/models/person.dart';
import 'package:contacts_bloc_app/screens/detail_screen.dart';
import 'package:contacts_bloc_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().showContacts();
  }

  void goRegisterScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        )).then((value) {
          context.read<HomeCubit>().showContacts();
        
    });
  }

  void goDetailScreen(Person person) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            person: person,
          ),
        )).then((value) {
          context.read<HomeCubit>().showContacts();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd55800),
      appBar: AppBar(
        backgroundColor: const Color(0xffE65F00),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        title: isSearching
            ? TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (value) {
                  context.read<HomeCubit>().searchContacts(value);
                },
              )
            : const Text("Contacts App"),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });
                        context.read<HomeCubit>().showContacts();
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => goRegisterScreen(),
          backgroundColor: const Color(0xffE65F00),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: BlocBuilder<HomeCubit, List<Person>>(

        builder: (context, list) {
          if (list.isNotEmpty) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var person = list[index];
                return GestureDetector(
                  onTap: () {
                    goDetailScreen(person);
                  },
                  child: Card(
                    elevation: 0,
                    color: const Color(0xfffff3e1),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${person.person_name} - ${person.person_phone}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2E2E2E)),
                          ),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("${person.person_name} delete?"),
                                  action: SnackBarAction(
                                      label: "YES", onPressed: () {
                                        context.read<HomeCubit>().delete(person.person_id);
                                      }),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Color(0xff2E2E2E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
