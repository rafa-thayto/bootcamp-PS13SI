final String tableEspecialidade = 'especialidade';

class EspecialidadeFields {
  static final List<String> values = [id, nome];

  static final String id = '_id';
  static final String nome = 'nome';
}

class Especialidade {
  final int? id;
  final String nome;

  const Especialidade({this.id, required this.nome});

  Especialidade copy({int? id, String? nome}) =>
      Especialidade(id: id ?? this.id, nome: nome ?? this.nome);

  Map<String, Object?> toMap() =>
      {EspecialidadeFields.id: id, EspecialidadeFields.nome: nome};

  static Especialidade fromMap(Map<String, Object?> map) => Especialidade(
      id: map[EspecialidadeFields.id] as int?,
      nome: map[EspecialidadeFields.nome] as String);
}
