import 'package:flutter/material.dart';
import 'package:ps13si/db/bootcamp_operations.dart';
import 'package:ps13si/model/bootcamp.dart';
import 'package:ps13si/routes/app_routes.dart';

class BootcampTileWidget extends StatefulWidget {
  final Bootcamp bootcamp;

  const BootcampTileWidget(this.bootcamp);

  @override
  _BootcampTileWidgetState createState() => _BootcampTileWidgetState();
}

class _BootcampTileWidgetState extends State<BootcampTileWidget> {
  var bootcampOperations = new BootcampOperations();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.event)),
      title: Text(widget.bootcamp.nome),
      subtitle: Text(widget.bootcamp.descricao),
      onTap: () {
        print('navegou pros detalhes');
      },
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () async {
                await Navigator.of(context).pushNamed(AppRoutes.BOOTCAMP_FORM,
                    arguments: widget.bootcamp);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                if (widget.bootcamp.id != null) {
                  bootcampOperations.delete(widget.bootcamp.id ?? 0);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
