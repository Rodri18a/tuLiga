import 'package:flutter/material.dart';

class AddEquiposPage extends StatefulWidget {
  const AddEquiposPage({super.key});

  @override
  State<AddEquiposPage> createState() => _AddEquiposPageState();
}

class _AddEquiposPageState extends State<AddEquiposPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar equipo')),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: 'Nombre del equipo')),
          ElevatedButton(onPressed: () {}, child: Text('data')),
        ],
      ),
    );
  }
}
