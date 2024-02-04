import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String databaseName = "contacts.sqlite";
  static Future<Database> databaseAccess() async {
    try {
      String databasePath = join(await getDatabasesPath(), databaseName);
      log("DATABASE PATH $databasePath");
      bool dbExists = await databaseExists(databasePath);
      if (!dbExists) {
        debugPrint("Database not found, copying from assets");
        ByteData data = await rootBundle.load("database/$databaseName");
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(databasePath).writeAsBytes(bytes, flush: true);
      } else {
        debugPrint("Database found at $databasePath");
      }
      return openDatabase(databasePath);
    } catch (e) {
      debugPrint("Error accessing database: $e");
      throw Exception('Database access failed');
    }
  }
}
