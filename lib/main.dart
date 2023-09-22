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
  double weight = 0.0; // Valor inicial del peso.
  double height = 0.0; // Valor inicial de la altura.
  double bmi = 0.0; // Variable para almacenar el resultado del IMC.

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width; // ancho de la pantalla.

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      backgroundColor: Colors.white, // fondo de la pantalla.
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alineación de columna.
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bienvenido, selecciona tu peso y altura', // Título
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Sección de peso
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Alineación de elementos en fila.
            children: <Widget>[
              Text(
                'Peso:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 10),
              Align(
                alignment: Alignment.center, // Alinea el texto al centro.
                child: Text(
                  '${weight.toStringAsFixed(1)} KG', // Muestra el peso actual.
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Slider(
            value: weight, // Valor actual del peso en el Slider.
            min: 0.0, // Valor mínimo del Slider.
            max: 200.0, // Valor máximo del Slider.
            onChanged: (newValue) {
              setState(() {
                weight =
                    newValue; // Actualiza el valor del peso al mover el Slider.
              });
            },
            activeColor: Colors.red, // Color de la barra del Slider.
          ),
          SizedBox(height: 20), // Espacio vertical.

          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Alineación de elementos en fila.
            children: <Widget>[
              Text(
                'Altura:', // Etiqueta de altura.
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 10), // Espacio en blanco.
              Align(
                alignment: Alignment.center, // Alinea el texto al centro.
                child: Text(
                  '${height.toStringAsFixed(1)} CM', // Muestra la altura actual.
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Slider(
            value: height, // Valor actual de la altura en el Slider.
            min: 0.0, // Valor mínimo del Slider.
            max: 250.0, // Valor máximo del Slider.
            onChanged: (newValue) {
              setState(() {
                height =
                    newValue; // Actualiza el valor de la altura al mover el Slider.
              });
            },
            activeColor: Colors.red, // Color de la barra del Slider.
          ),
          SizedBox(height: 20), // Espacio vertical.
          // Botón "Calcular" con cálculo de IMC
          Center(
            child: Container(
              width: screenWidth / 2, // Ancho del conteinr
              child: ElevatedButton(
                onPressed: () {
                  // Calcular el IMC
                  double heightInMeters =
                      height / 100; // Convertir altura a metros.
                  double bmiResult = weight /
                      (heightInMeters * heightInMeters); // Calcular IMC.
                  setState(() {
                    bmi = bmiResult; // Almacenar el resultado del IMC.
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors
                      .grey, // Cambia el color de fondo del botón "Calcular" a gris.
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Alineación de elementos en fila.
                  children: <Widget>[
                    Icon(Icons.calculate), // Icono para la insignia.
                    SizedBox(width: 5), // Espacio en blanco.
                    Text(
                      'Calcular', // Texto del botón.
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacio vertical.
          // Resultado del IMC
          Center(
            child: Text(
              'Resultado del IMC: ${bmi.toStringAsFixed(2)}', // Muestra el resultado del IMC.
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
