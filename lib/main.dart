import 'package:flutter/material.dart';
import 'package:agroxpert/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroXpert',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Aquí agregamos el generador de rutas
      onGenerateRoute: Routes.generateRoute,
      // La pantalla de inicio sigue siendo MyHomePage
      home: const MyHomePage(title: 'AgroXdemo Demo Page'),
      //home: const EjemploVista2(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/estimates_production');
              },
              child: const Text('Estimados de Producción'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lots');
              },
              child: const Text('Lots'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/historial_harvest');
              },
              child: const Text('Historial cosechas'),
            ),
          ],
        ),
      ),
    );
  }
}
