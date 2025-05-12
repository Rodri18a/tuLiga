import 'package:flutter/material.dart';
import 'package:tu_liga_app/services/firebase_services.dart';

class EditEquiposPage extends StatefulWidget {
  const EditEquiposPage({super.key});

  @override
  State<EditEquiposPage> createState() => _EditEquiposPageState();
}

class _EditEquiposPageState extends State<EditEquiposPage> {
  TextEditingController nombreController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    //Recibir los argumentos
    final Map args = ModalRoute.of(context)?.settings.arguments as Map;
    final String uid = args['uid'];

    //Obtener el nombre del equipo
    nombreController.text = args['nombre'];

    return Scaffold(
      appBar: AppBar(title: Text('Editar equipo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Imagen del equipo
            Container(width: 300, height: 300, color: Colors.deepOrange),
            SizedBox(height: 10),
            //Nombre del equipo
            TextField(
              controller: nombreController,
              decoration: InputDecoration(hintText: 'Nombre del equipo'),
            ),
            ElevatedButton(
              onPressed: () async {
                //Actualizar el equipo
                await editEquipo(uid, nombreController.text).then((value) {
                  //Regresar a la pantalla anterior
                  Navigator.pop(context);
                });
              },
              child: Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
