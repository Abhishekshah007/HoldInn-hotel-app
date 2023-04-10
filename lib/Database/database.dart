import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

part 'database.g.dart';

@DriftDatabase(tables:[UserTable])
class UserDatabase extends _$UserDatabase {

  UserDatabase(): super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Future<UserTableData> getUserById(int id) async {
  //   var val = await (select(userTable)..where((tbl) => tbl.id.equals(id))).getSingle();
  //   if (val != null) {
  //     int rowsInserted = await into(userTable).insert(val);
  //     print('Inserted $rowsInserted rows');
  //   }
  //   return val;
  // }

Future<dynamic> insertUserDetails(UserTableCompanion user) async{
  return await into(userTable).insert(user);
}


}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory(); //internal
    final dbFile = File(join(dbFolder.path, "user.sqlite"));
    return NativeDatabase(dbFile);
  });
}



