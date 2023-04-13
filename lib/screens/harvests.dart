import 'package:flutter/material.dart';

class HarvestScreen extends StatefulWidget {
  const HarvestScreen({super.key});

  @override
  State<HarvestScreen> createState() => _HarvestScreentate();
}

class _HarvestScreentate extends State<HarvestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cosechas'),
        ),
        body: Container(
          alignment:  Alignment.center,
          child: ElevatedButton(
            child: const Text("Ver Informe Final"),
            onPressed: () => {Navigator.of(context).pushNamed('/final_report')},
          ),
        ));
  }
}
