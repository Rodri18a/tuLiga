import 'package:cloud_firestore/cloud_firestore.dart';

//Conexion a la base de datos
FirebaseFirestore db = FirebaseFirestore.instance;

//Obtener informacion de los equipos en la base de datos
Future<List> getEquipos() async {
  List equipos = [];
  //Obtener la coleccion de equipos
  QuerySnapshot queryEquipos = await db.collection("equipos").get();

  queryEquipos.docs.forEach((documento) {
    final Map data = documento.data() as Map<String, dynamic>;
    //Crear un mapa con los datos del documento
    final equipo = {'uid': documento.id, 'nombre': data['nombre']};
    //Llamar a la funcion para agregar el equipo a la lista
    equipos.add(equipo);
  });

  //Demora intencional
  //await Future.delayed(const Duration(seconds: 5));

  return equipos;
}

//Agregar un nuevo equipo a la base de datos
Future<void> addEquipo(String nombre) async {
  CollectionReference collectionReferenceEquipos = db.collection("equipos");

  await collectionReferenceEquipos.add({'nombre': nombre});
}

//Editar un equipo existente en la base de datos
Future<void> editEquipo(String uid, String nombre) async {
  CollectionReference collectionReferenceEquipos = db.collection("equipos");

  await collectionReferenceEquipos.doc(uid).set({'nombre': nombre});
}

//Eliminar un equipo de la base de datos
Future<void> deleteEquipo(String uid) async {
  CollectionReference collectionReferenceEquipos = db.collection("equipos");

  await collectionReferenceEquipos.doc(uid).delete();
}
