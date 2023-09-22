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
    } else if (bmi <= 24.9) {
      return "Normal";
    } else {
      return "Sobrepeso";
    }
  }

  // Función para obtener la ruta de la imagen según el resultado del IMC.
  String getImagePath(String imcMessage) {
    if (imcMessage == "Normal") {
      return "assets/images/bueno.png"; // Ruta de la imagen para "Normal"
    } else if (imcMessage == "Sobrepeso") {
      return "assets/images/gordo.png"; // Ruta de la imagen para "Sobrepeso"
    } else {
      return "assets/images/flaco.png"; // Ruta de la imagen para "Malo"
    }
  }

  // Función para obtener un comentario según el resultado del IMC.
  String getIMCComment(String imcMessage) {
    if (imcMessage == "Normal") {
      return "¡Tu peso es normal! ¡Sigue así!";
    } else if (imcMessage == "Sobrepeso") {
      return "Tienes sobrepeso. Consulta a un médico.";
    } else {
      return "Tienes un IMC bajo. Consulta a un médico.";
    }
  }

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
          // Mostrar mensaje de IMC (Sobrepeso, Normal, Malo)
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
          // Mostrar imagen según el resultado del IMC.
          if (getIMCMessage(bmi) != "Normal")
            Center(
              child: Column(
                children: [
                  Image.asset(
                    getImagePath(getIMCMessage(
                        bmi)), // Utiliza la función para obtener la imagen.
                    width: 150, // Ancho de la imagen ajustado.
                    height: 150, // Alto de la imagen ajustado.
                  ),
                  SizedBox(height: 20),
                  Text(
                    getIMCComment(getIMCMessage(
                        bmi)), // Muestra el comentario según el resultado del IMC.
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
