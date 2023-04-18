import 'package:flutter/material.dart';
import '../screens/estimates_production.dart';
import '../screens/final_report.dart';
import '../screens/harvests.dart';
import '../screens/lots.dart';
import '../screens/historial_harvest.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/lots':
        return MaterialPageRoute(builder: (_) => LotsScreen());
      case '/harvests':
        return MaterialPageRoute(builder: (_) => HarvestScreen());
      // Agrega más rutas aquí si es necesario
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('La ruta ${settings.name} no se ha definido.'),
                  ),
                ));
    }
  }
}
