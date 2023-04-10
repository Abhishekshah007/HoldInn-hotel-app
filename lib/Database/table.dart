import 'package:drift/drift.dart';

class UserTable extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get countryCode => text()();
  TextColumn get number => text().withLength(max: 10)();
}