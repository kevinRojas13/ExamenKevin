import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Mi Aplicación con Fondo Blanco',
          ),
        ),
        // Cambia el color de fondo de la aplicación a blanco
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'Contenido de la aplicación',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
