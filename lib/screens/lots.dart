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
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error al obtener los datos');
          } else if (snapshot.connectionState == ConnectionState.done) {
            final lots_list = snapshot.data as List<FarmLotModel>;
            return GridView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: lots_list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemBuilder: (context, index) {
                final lot = lots_list[index];
                return Card(
                  child: InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed('/estimacion/${lot.id}'),
                    child: Center(
                      child: Text('Lot ${lot.nameLot}'),
                    ),
                  ),
                );
              },
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
}
