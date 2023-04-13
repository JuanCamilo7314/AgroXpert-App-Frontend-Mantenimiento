import 'package:agroxpert/screens/lots.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/final_report.dart';
import '../screens/harvests.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) =>
      const MyHomePage(title: 'AgroXpert Demo Page'),
  '/lots': (BuildContext context) => const LotsScreen(),
  '/harvests': (BuildContext context) => const HarvestScreen(),
  '/final_report': (BuildContext context) => const FinalReportScreen(),
};
