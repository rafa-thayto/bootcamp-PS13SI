import 'package:ps13si/db/database.dart';
import 'package:ps13si/model/empresa.dart';

class EmpresaOperations {
  EmpresaOperations? empresaOperations;

  final dbProvider = DatabaseRepository.instance;

  Future<Empresa> create(Empresa empresa) async {
    final db = await dbProvider.database;

    final id = await db.insert(tableEmpresa, empresa.toMap());
    return empresa.copy(id: id);
  }

  Future<Empresa> get(int id) async {
    final db = await dbProvider.database;
    final maps = await db.query(tableEmpresa,
        columns: EmpresaFields.values,
        where: '${EmpresaFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Empresa.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found.');
    }
  }

  Future<List<Empresa>> getAll() async {
    final db = await dbProvider.database;

    final result = await db.query(tableEmpresa);

    return result.map((map) => Empresa.fromMap(map)).toList();
  }

  Future<int> update(Empresa empresa) async {
    final db = await dbProvider.database;

    return await db.update(tableEmpresa, empresa.toMap(),
        where: '${EmpresaFields.id} = ?', whereArgs: [empresa.id]);
  }

  Future<int> delete(int id) async {
    final db = await dbProvider.database;

    return await db.delete(tableEmpresa,
        where: '${EmpresaFields.id} = ?', whereArgs: [id]);
  }
}
