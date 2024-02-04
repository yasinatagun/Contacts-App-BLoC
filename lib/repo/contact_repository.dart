import 'package:contacts_bloc_app/models/person.dart';
import 'package:contacts_bloc_app/sqlite/database_helper.dart';

class ContactsRepository {
  // REGISTER CUBIT
  Future<void> register(String person_name, String person_phone) async {
    var database = await DatabaseHelper.databaseAccess();
    var map = <String, dynamic>{};
    map["person_name"] = person_name;
    map["person_phone"] = person_phone;
    await database.insert("contacts", map);
  }

// DETAIL CUBIT
  Future<void> update(
      int person_id, String person_name, String person_phone) async {
    var database = await DatabaseHelper.databaseAccess();
    var map = <String, dynamic>{};
    map["person_name"] = person_name;
    map["person_phone"] = person_phone;
    await database.update("contacts", map, where: "person_id=?", whereArgs: [person_id]);
  }

// HOME CUBIT
  Future<List<Person>> showContacts() async {
    var database = await DatabaseHelper.databaseAccess();

    List<Map<String, dynamic>> maps =
        await database.rawQuery("SELECT * FROM contacts");
    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Person(
          person_id: row["person_id"],
          person_name: row["person_name"],
          person_phone: row["person_phone"]);
    });
  }

  Future<List<Person>> searchContact(String keyword) async {
    var database = await DatabaseHelper.databaseAccess();

    List<Map<String, dynamic>> maps = await database
        .rawQuery("SELECT * FROM contacts WHERE person_name like '%$keyword%'");
    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Person(
          person_id: row["person_id"],
          person_name: row["person_name"],
          person_phone: row["person_phone"]);
    });
  }

  Future<void> delete(int person_id) async {
    var database = await DatabaseHelper.databaseAccess();
    await database
        .delete("contacts", where: "person_id=?", whereArgs: [person_id]);
  }
}
