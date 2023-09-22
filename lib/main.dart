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
  double bmi = 0.0; // Variable para almacenar el resultado del IMC

  // Función para calcular el mensaje basado en el IMC.
  String getIMCMessage(double bmi) {
    if (bmi < 18.5) {
      return "Malo";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Bueno";
    } else {
      return "Regular";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width; // Obtiene el ancho de la pantalla.

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'), // Título de la barra de navegación.
      ),
      backgroundColor:
          Colors.white, // Establece el color de fondo de la pantalla.
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
          // Sección de peso
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
          // Sección de altura
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
          // Botón "Calcular" con cálculo de IMC
          Center(
            child: Container(
              width: screenWidth / 2,
              child: ElevatedButton(
                onPressed: () {
                  // Calcular el IMC
                  double heightInMeters = height / 100;
                  double bmiResult = weight / (heightInMeters * heightInMeters);
                  setState(() {
                    bmi = bmiResult;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.calculate),
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
          SizedBox(height: 20),
          // Resultado del IMC
          Center(
            child: Text(
              'Resultado del IMC: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          // Mostrar mensaje de IMC (Bueno, Malo, Regular)
          Center(
            child: Text(
              getIMCMessage(bmi), // Utiliza la función para obtener el mensaje.
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors
                    .blue, // Cambia el color del mensaje según el resultado.
              ),
            ),
          ),
        ],
      ),
    );
  }
}
