import 'package:agroxpert/screens/lots.dart';
import 'package:flutter/material.dart';

import '../main.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) =>
      const MyHomePage(title: 'AgroXpert Demo Page'),
  '/lots': (BuildContext context) => const LotsScreen(),
};
