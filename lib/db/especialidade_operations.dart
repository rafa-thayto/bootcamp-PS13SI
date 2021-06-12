import 'package:ps13si/db/database.dart';
import 'package:ps13si/model/especialidade.dart';

class EspecialidadeOperations {
  EspecialidadeOperations? especialidadeOperations;

  final dbProvider = DatabaseRepository.instance;

  Future<Especialidade> create(Especialidade especialidade) async {
    final db = await dbProvider.database;

    final id = await db.insert(tableEspecialidade, especialidade.toMap());
    return especialidade.copy(id: id);
  }

  Future<Especialidade> get(int id) async {
    final db = await dbProvider.database;
    final maps = await db.query(tableEspecialidade,
        columns: EspecialidadeFields.values,
        where: '${EspecialidadeFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Especialidade.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found.');
    }
  }

  Future<List<Especialidade>> getAll() async {
    final db = await dbProvider.database;

    final result = await db.query(tableEspecialidade);

    return result.map((json) => Especialidade.fromMap(json)).toList();
  }

  Future<int> update(Especialidade especialidade) async {
    final db = await dbProvider.database;

    return await db.update(tableEspecialidade, especialidade.toMap(),
        where: '${EspecialidadeFields.id} = ?', whereArgs: [especialidade.id]);
  }

  Future<int> delete(int id) async {
    final db = await dbProvider.database;

    return await db.delete(tableEspecialidade,
        where: '${EspecialidadeFields.id} = ?', whereArgs: [id]);
  }
}
