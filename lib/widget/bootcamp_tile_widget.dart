import 'package:flutter/material.dart';
import 'package:ps13si/model/bootcamp.dart';

class BootcampTileWidget extends StatelessWidget {
  final Bootcamp bootcamp;

  const BootcampTileWidget(this.bootcamp);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.event)),
      title: Text(bootcamp.nome),
      subtitle: Text(bootcamp.descricao),
    );
  }
}
