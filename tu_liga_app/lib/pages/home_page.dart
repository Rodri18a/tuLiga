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
                return Text(snapshot.data?[index]['nombre']);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
