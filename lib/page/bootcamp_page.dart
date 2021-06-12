import 'package:flutter/material.dart';
import 'package:ps13si/db/bootcamp_operations.dart';
import 'package:ps13si/model/bootcamp.dart';
import 'package:ps13si/routes/app_routes.dart';
import 'package:ps13si/widget/bootcamp_tile_widget.dart';

class BootcampPage extends StatefulWidget {
  @override
  _BootcampPageState createState() => _BootcampPageState();
}

class _BootcampPageState extends State<BootcampPage> {
  var bootcampOperations = BootcampOperations();

  late List<Bootcamp> bootcamps;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  // @override
  // void dispose() {
  //   DatabaseRepository.instance.close();

  //   super.dispose();
  // }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.bootcamps = await bootcampOperations.getAll();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'PS13SI',
            style: TextStyle(fontSize: 24),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                await Navigator.of(context).pushNamed(AppRoutes.BOOTCAMP_FORM,
                    arguments: Bootcamp(
                        nomeEmpresa: '',
                        candidatosMax: 0,
                        descricao: '',
                        especialidade: '',
                        localizacao: '',
                        nome: ''));
                refreshNotes();
              },
            ),
            SizedBox(width: 12),
          ],
        ),
        body: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : bootcamps.isEmpty
                    ? Text(
                        'Nenhum bootcamp cadastrado ainda :(',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    : ListView.builder(
                        itemCount: bootcamps.length,
                        itemBuilder: (cxt, i) =>
                            BootcampTileWidget(bootcamps[i]),
                      )),
      );

//   Widget buildNotes() => StaggeredGridView.countBuilder(
//         padding: EdgeInsets.all(8),
//         itemCount: bootcamps.length,
//         staggeredTileBuilder: (index) => StaggeredTile.fit(2),
//         crossAxisCount: 4,
//         mainAxisSpacing: 4,
//         crossAxisSpacing: 4,
//         itemBuilder: (context, index) {
//           final note = bootcamps[index];

//           return GestureDetector(
//             onTap: () async {
//               await Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => NoteDetailPage(noteId: note.id!),
//               ));

//               refreshNotes();
//             },
//             child: NoteCardWidget(note: note, index: index),
//           );
//         },
//       );
}
