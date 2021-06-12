import 'package:ps13si/db/database.dart';
import 'package:ps13si/model/bootcamp.dart';

class BootcampOperations {
  BootcampOperations? bootcampOperations;

  final dbProvider = DatabaseRepository.instance;

  Future<Bootcamp> create(Bootcamp bootcamp) async {
    final db = await dbProvider.database;

    final id = await db.insert(tableBootcamp, bootcamp.toMap());
    return bootcamp.copy(id: id);
  }

  Future<Bootcamp> get(int id) async {
    final db = await dbProvider.database;
    final maps = await db.query(tableBootcamp,
        columns: BootcampFields.values,
        where: '${BootcampFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Bootcamp.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found.');
    }
  }

  Future<List<Bootcamp>> getAll() async {
    final db = await dbProvider.database;

    final result = await db.query(tableBootcamp);

    return result.map((map) => Bootcamp.fromMap(map)).toList();
  }

  Future<int> update(Bootcamp bootcamp) async {
    final db = await dbProvider.database;

    return await db.update(tableBootcamp, bootcamp.toMap(),
        where: '${BootcampFields.id} = ?', whereArgs: [bootcamp.id]);
  }

  Future<int> delete(int id) async {
    final db = await dbProvider.database;

    return await db.delete(tableBootcamp,
        where: '${BootcampFields.id} = ?', whereArgs: [id]);
  }
}
