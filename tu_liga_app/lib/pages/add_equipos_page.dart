import 'package:flutter/material.dart';
import 'package:tu_liga_app/services/firebase_services.dart';

class AddEquiposPage extends StatefulWidget {
  const AddEquiposPage({super.key});

  @override
  State<AddEquiposPage> createState() => _AddEquiposPageState();
}

class _AddEquiposPageState extends State<AddEquiposPage> {
  TextEditingController nombreController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar equipo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(hintText: 'Nombre del equipo'),
            ),
            ElevatedButton(
              onPressed: () async {
                await addEquipo(nombreController.text).then((_) {
                  //Regresar a la pantalla anterior
                  Navigator.pop(context);
                });
              },
              child: Text('Agregar equipo'),
            ),
          ],
        ),
      ),
    );
  }
}
