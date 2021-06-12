import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ps13si/model/bootcamp.dart';

class BootcampFormPage extends StatelessWidget {
  const BootcampFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Bootcamp'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome Empresa'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Especialidade'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Localização'),
                ),
                TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Número max. de candidatos'),
                    keyboardType: TextInputType.number),
              ],
            ),
          )),
    );
  }
}
