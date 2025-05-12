import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tu_liga_app/pages/add_equipos_page.dart';
import 'package:tu_liga_app/pages/edit_equipos_page.dart';
import 'package:tu_liga_app/pages/home_page.dart';
import 'package:tu_liga_app/services/firebase_services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titulo',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AddEquiposPage(),
        '/edit': (context) => const EditEquiposPage(),
      },
    );
  }
}
