import 'package:cloud_firestore/cloud_firestore.dart';

//Conexion a la base de datos
FirebaseFirestore db = FirebaseFirestore.instance;

//Obtener informacion de los equipos en la base de datos
Future<List> getEquipos() async {
  List equipos = [];

  CollectionReference collectionReferenceEquipos = db.collection("equipos");

  QuerySnapshot queryEquipos = await collectionReferenceEquipos.get();

  queryEquipos.docs.forEach((documento) {
    equipos.add(documento.data());
  });

  //Demora intencional
  await Future.delayed(const Duration(seconds: 5));

  return equipos;
}
