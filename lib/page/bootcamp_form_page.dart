import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ps13si/db/bootcamp_operations.dart';
import 'package:ps13si/model/bootcamp.dart';

class BootcampFormPage extends StatelessWidget {
  var bootcampOperations = BootcampOperations();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, String?>();

  @override
  Widget build(BuildContext context) {
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
                bootcampOperations.create(Bootcamp(
                  nome: _formData[BootcampFields.nome] ?? '',
                  descricao: _formData[BootcampFields.descricao] ?? '',
                  nomeEmpresa: _formData[BootcampFields.nomeEmpresa] ?? '',
                  especialidade: _formData[BootcampFields.especialidade] ?? '',
                  localizacao: _formData[BootcampFields.localizacao] ?? '',
                  candidatosMax:
                      int.parse(_formData[BootcampFields.candidatosMax] ?? '0'),
                ));
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
