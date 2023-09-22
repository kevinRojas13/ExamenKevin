import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double weight = 0.0; // Valor inicial del peso
  double height = 0.0; // Valor inicial de la altura

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bienvenido, selecciona tu peso y altura',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Peso:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${weight.toStringAsFixed(1)} KG',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Slider(
            value: weight,
            min: 0.0,
            max: 200.0,
            onChanged: (newValue) {
              setState(() {
                weight = newValue;
              });
            },
            activeColor: Colors.red,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Altura:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${height.toStringAsFixed(1)} CM',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Slider(
            value: height,
            min: 0.0,
            max: 250.0,
            onChanged: (newValue) {
              setState(() {
                height = newValue;
              });
            },
            activeColor: Colors.red,
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: screenWidth /
                  2, // Establece el ancho a la mitad de la pantalla
              child: ElevatedButton(
                onPressed: () {
                  // Acción a realizar cuando se presiona el botón "Calcular"
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Cambia el color de fondo a gris
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.calculate), // Icono para la insignia
                    SizedBox(width: 5),
                    Text(
                      'Calcular',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
