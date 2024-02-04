// ignore_for_file: non_constant_identifier_names

import 'package:contacts_bloc_app/repo/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<void> {
  RegisterCubit() : super(0);

  var repo = ContactsRepository();

    Future<void> register(String person_name, String person_phone) async{
      await repo.register(person_name, person_phone);
    }
  


}