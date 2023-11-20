import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      title: 'Somatório de Divisíveis por 3 ou 5',
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _numero = 0;
  int _resultado = 0;

  void _calcularSoma() {
    int soma = 0;
    for (int i = 1; i < _numero; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        soma += i;
      }
    }
    setState(() {
      _resultado = soma;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _numero = int.tryParse(value) ?? 0;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Escolha um número',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _calcularSoma();
                  },
                  child: Text('Calcular'),
                ),
                SizedBox(height: 20),
                Text(
                  'O somatório dos números divisíveis por 3 ou 5 menores que $_numero é $_resultado',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
