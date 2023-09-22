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
          Text(
            'Peso (kg): ${weight.toStringAsFixed(1)}',
            style: TextStyle(fontSize: 18),
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
          ),
          SizedBox(height: 20),
          Text(
            'Altura (cm): ${height.toStringAsFixed(1)}',
            style: TextStyle(fontSize: 18),
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
          ),
        ],
      ),
    );
  }
}
