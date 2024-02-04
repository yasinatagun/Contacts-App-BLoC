// ignore_for_file: non_constant_identifier_names

import 'package:contacts_bloc_app/models/person.dart';
import 'package:contacts_bloc_app/repo/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<List<Person>> {
  HomeCubit() : super(<Person>[]);

  var repo = ContactsRepository();

  Future<void> showContacts() async {
    var list = await repo.showContacts();
    emit(list);
  }

  Future<void> searchContacts(String keyword) async {
    var list = await repo.searchContact(keyword);
    emit(list);
  }

    Future<void> delete(int person_id) async {
    await repo.delete(person_id);
    await showContacts();
  }
}
