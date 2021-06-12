import 'package:ps13si/model/bootcamp.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseRepository {
  static final DatabaseRepository instance = DatabaseRepository._init();

  DatabaseRepository._init();

  final _dbName = 'pssi';
  final _dbVersion = 1;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb();
    return _database!;
  }

  _initDb() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final intType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableBootcamp (
        ${BootcampFields.id} $idType,
        ${BootcampFields.nome} $textType,
        ${BootcampFields.descricao} $textType,
        ${BootcampFields.nomeEmpresa} $textType,
        ${BootcampFields.especialidade} $textType,
        ${BootcampFields.candidatosMax} $intType,
        ${BootcampFields.localizacao} $textType
      )
    ''');

    // await db.execute('''
    //   CREATE TABLE $tableEmpresa (
    //     ${EmpresaFields.id} $idType,
    //     ${EmpresaFields.nome} $textType
    //   )
    // ''');

    // await db.execute('''
    //   CREATE TABLE $tableEspecialidade (
    //     ${EspecialidadeFields.id} $idType,
    //     ${EspecialidadeFields.nome} $textType
    //   )
    // ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
