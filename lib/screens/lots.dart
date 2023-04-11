import 'package:agroxpert/models/farm_lot_model.dart';
import 'package:flutter/material.dart';

import '../services/estimation_api.dart';

class LotsScreen extends StatefulWidget {
  const LotsScreen({super.key});

  @override
  State<LotsScreen> createState() => _LotsScreenState();
}

class _LotsScreenState extends State<LotsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lots'),
      ),
      body: FutureBuilder(
        future: getLots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Text('Error al obtener los datos');
          } else if (snapshot.connectionState == ConnectionState.done) {
            final lots_list = snapshot.data as List<FarmLotModel>;
            return Column(
              children: [
                Expanded(
                    child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: lots_list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemBuilder: (context, index) {
                    final lot = lots_list[index];
                    return bodyCardLot(lot);
                  },
                )),
                //FloatingActionButton alignment right
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () => {print("Agregando nuevo")},
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

// Widget bodycard
  Widget bodyCardLot(FarmLotModel lot) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lot.nameLot,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text("Número de árboles: ${lot.numberTrees}"),
            ElevatedButton(
              child: const Text("Ver Cosechas"),
              onPressed: () => {
                Navigator.of(context)
                    .pushNamed('/harvests', arguments: lot.id)
              },
            ),
          ],
        ),
      ),
    );
  }
}
