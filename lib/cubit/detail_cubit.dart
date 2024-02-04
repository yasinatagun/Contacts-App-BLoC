// ignore_for_file: non_constant_identifier_names

import 'package:contacts_bloc_app/repo/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCubit extends Cubit<void> {
  DetailCubit() : super(0);

  var repo = ContactsRepository();

  Future<void> update(int person_id, String person_name, String person_phone) async {
    await repo.update(person_id, person_name, person_phone);
  }
}
