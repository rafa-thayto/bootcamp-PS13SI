import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ps13si/db/bootcamp_operations.dart';
import 'package:ps13si/model/bootcamp.dart';

class BootcampFormPage extends StatefulWidget {
  @override
  _BootcampFormPageState createState() => _BootcampFormPageState();
}

class _BootcampFormPageState extends State<BootcampFormPage> {
  var bootcampOperations = BootcampOperations();

  final _formKey = GlobalKey<FormState>();

  final _formData = Map<String, String?>();

  int? bootcampId = 0;

  void _loadFormData(Bootcamp bootcamp) {
    bootcampId = bootcamp.id;
    _formData[BootcampFields.nome] = bootcamp.nome;
    _formData[BootcampFields.descricao] = bootcamp.descricao;
    _formData[BootcampFields.nomeEmpresa] = bootcamp.nomeEmpresa;
    _formData[BootcampFields.especialidade] = bootcamp.especialidade;
    _formData[BootcampFields.localizacao] = bootcamp.localizacao;
    _formData[BootcampFields.candidatosMax] = bootcamp.candidatosMax.toString();
  }

  @override
  Widget build(BuildContext context) {
    var bootcamp = ModalRoute.of(context)!.settings.arguments as Bootcamp;

    _loadFormData(bootcamp);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Bootcamp'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _formKey.currentState!.validate();

              if (isValid) {
                _formKey.currentState!.save();

                if (bootcampId != null && bootcampId != 0) {
                  var obj = Bootcamp(
                    id: bootcampId,
                    nome: _formData[BootcampFields.nome] ?? '',
                    descricao: _formData[BootcampFields.descricao] ?? '',
                    nomeEmpresa: _formData[BootcampFields.nomeEmpresa] ?? '',
                    especialidade:
                        _formData[BootcampFields.especialidade] ?? '',
                    localizacao: _formData[BootcampFields.localizacao] ?? '',
                    candidatosMax: int.parse(
                        _formData[BootcampFields.candidatosMax] ?? '0'),
                  );
                  bootcampOperations.update(obj);
                } else {
                  var obj = Bootcamp(
                    nome: _formData[BootcampFields.nome] ?? '',
                    descricao: _formData[BootcampFields.descricao] ?? '',
                    nomeEmpresa: _formData[BootcampFields.nomeEmpresa] ?? '',
                    especialidade:
                        _formData[BootcampFields.especialidade] ?? '',
                    localizacao: _formData[BootcampFields.localizacao] ?? '',
                    candidatosMax: int.parse(
                        _formData[BootcampFields.candidatosMax] ?? '0'),
                  );
                  bootcampOperations.create(obj);
                }
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {},
                  onSaved: (value) => _formData[BootcampFields.nome] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                  validator: (value) {},
                  onSaved: (value) =>
                      _formData[BootcampFields.descricao] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome Empresa'),
                  validator: (value) {},
                  onSaved: (value) =>
                      _formData[BootcampFields.nomeEmpresa] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Especialidade'),
                  validator: (value) {},
                  onSaved: (value) =>
                      _formData[BootcampFields.especialidade] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Localização'),
                  validator: (value) {},
                  onSaved: (value) =>
                      _formData[BootcampFields.localizacao] = value,
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Número max. de candidatos'),
                  keyboardType: TextInputType.number,
                  initialValue: '0',
                  validator: (value) {},
                  onSaved: (value) =>
                      _formData[BootcampFields.candidatosMax] = value,
                ),
              ],
            ),
          )),
    );
  }
}
