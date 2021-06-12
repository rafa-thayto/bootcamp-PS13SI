final String tableEmpresa = 'empresa';

class EmpresaFields {
  static final List<String> values = [id, nome];

  static final String id = '_id';
  static final String nome = 'nome';
}

class Empresa {
  final int? id;
  final String nome;

  const Empresa({
    this.id,
    required this.nome,
  });

  Empresa copy({int? id, String? nome}) => Empresa(
        id: id ?? this.id,
        nome: nome ?? this.nome,
      );

  Map<String, Object?> toMap() => {
        EmpresaFields.id: id,
        EmpresaFields.nome: nome,
      };

  static Empresa fromMap(Map<String, Object?> map) => Empresa(
        id: map[EmpresaFields.id] as int?,
        nome: map[EmpresaFields.nome] as String,
      );
}
