import 'package:flutter/material.dart';
import 'package:tu_liga_app/services/firebase_services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titulo", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: getEquipos(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length, //Cantidad de registros
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) async {
                    //Eliminar el registro
                    await deleteEquipo(snapshot.data?[index]['uid']);
                    //Recargar la pantalla
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;
                    if (direction == DismissDirection.endToStart) {
                      result = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Eliminar'),
                            content: Text(
                              "¿Estás seguro de eliminar a ${snapshot.data?[index]['nombre']}?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Eliminar'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  key: Key(snapshot.data?[index]['uid']),
                  child: Card(
                    child: ListTile(
                      title: Text(snapshot.data?[index]['nombre']),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () async {
                          //Navegar a la pantalla de editar
                          await Navigator.pushNamed(
                            context,
                            '/edit',
                            arguments: {
                              'uid': snapshot.data?[index]['uid'],
                              'nombre': snapshot.data?[index]['nombre'],
                            },
                          );
                          Navigator.pushReplacementNamed(context, '/');
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          //Recargar la pantalla
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, '/');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
