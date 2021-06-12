final String tableBootcamp = 'bootcamp';

class BootcampFields {
  static final List<String> values = [
    id,
    nome,
    nomeEmpresa,
    especialidade,
    candidatosMax,
    localizacao
  ];

  static final String id = '_id';
  static final String nome = 'nome';
  static final String descricao = 'descricao';
  static final String nomeEmpresa = 'nomeEmpresa';
  static final String especialidade = 'especialidade';
  static final String candidatosMax = 'candidatosMax';
  static final String localizacao = 'localizacao';
}

class Bootcamp {
  final int? id;
  final String nome;
  final String descricao;
  final String nomeEmpresa;
  final String especialidade;
  final int candidatosMax;
  final String localizacao;

  const Bootcamp({
    this.id,
    required this.nome,
    required this.descricao,
    required this.nomeEmpresa,
    required this.especialidade,
    required this.candidatosMax,
    required this.localizacao,
  });

  Bootcamp copy({
    int? id,
    String? nome,
    String? descricao,
    String? nomeEmpresa,
    String? especialidade,
    int? candidatosMax,
    String? localizacao,
  }) =>
      Bootcamp(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        descricao: descricao ?? this.descricao,
        nomeEmpresa: nomeEmpresa ?? this.nomeEmpresa,
        especialidade: especialidade ?? this.especialidade,
        candidatosMax: candidatosMax ?? this.candidatosMax,
        localizacao: localizacao ?? this.localizacao,
      );

  Map<String, Object?> toMap() => {
        BootcampFields.id: id,
        BootcampFields.nome: nome,
        BootcampFields.descricao: descricao,
        BootcampFields.nomeEmpresa: nomeEmpresa,
        BootcampFields.especialidade: especialidade,
        BootcampFields.candidatosMax: candidatosMax,
        BootcampFields.localizacao: localizacao,
      };

  static Bootcamp fromMap(Map<String, Object?> map) => Bootcamp(
        id: map[BootcampFields.id] as int?,
        nome: map[BootcampFields.nome] as String,
        descricao: map[BootcampFields.descricao] as String,
        nomeEmpresa: map[BootcampFields.nomeEmpresa] as String,
        especialidade: map[BootcampFields.especialidade] as String,
        candidatosMax: map[BootcampFields.candidatosMax] as int,
        localizacao: map[BootcampFields.localizacao] as String,
      );
}
