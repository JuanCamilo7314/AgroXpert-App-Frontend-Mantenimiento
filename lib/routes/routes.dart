import 'package:agroxpert/screens/lots.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/final_report.dart';
import '../screens/harvests.dart';
import '../screens/historial_harvest.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) =>
      const MyHomePage(title: 'AgroXpert Demo Page'),
  '/lots': (BuildContext context) => const LotsScreen(),
  '/harvests': (BuildContext context) => const HarvestScreen(),
  '/final_report': (BuildContext context) => const FinalReportScreen(),
  '/historial_harvest': (BuildContext context) => const historial_harvest(),
};
