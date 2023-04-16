/* import 'package:agroxpert/screens/lots.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/estimarProduccionView.dart';
import '../screens/final_report.dart';
import '../screens/harvests.dart';
import '../screens/historial_harvest.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) =>
      const MyHomePage(title: 'AgroXpert Demo Page'),
  '/lots': (BuildContext context) => const LotsScreen(),
  '/harvests': (BuildContext context) => const HarvestScreen(),
  '/final_report': (BuildContext context) => const FinalReportScreen(),
  '/estimates_production': (BuildContext context) => const EstimatesProductionScreen(),

};
 */

import 'package:flutter/material.dart';
import '../screens/estimarProduccionView.dart';
import '../screens/final_report.dart';
import '../screens/harvests.dart';
import '../screens/lots.dart';
import '../screens/historial_harvest.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/estimates_production':
        return MaterialPageRoute(builder: (_) => EstimatesProductionScreen());
      case '/lots':
        return MaterialPageRoute(builder: (_) => LotsScreen());
      case '/harvests':
        return MaterialPageRoute(builder: (_) => HarvestScreen());
      case '/final_report':
        return MaterialPageRoute(builder: (_) => FinalReportScreen());
      case '/historial_harvest':
        return MaterialPageRoute(builder: (_) => HistoricHarvest());

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
