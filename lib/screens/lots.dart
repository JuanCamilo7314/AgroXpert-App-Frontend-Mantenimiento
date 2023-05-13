import 'package:agroxpert/models/farm_lot_model.dart';
import 'package:flutter/material.dart';

import '../widgets/card_lots.dart';
// import '../services/estimation_api.dart';
import '../services/farm_lot_api.dart';

class LotsScreen extends StatefulWidget {
  const LotsScreen({super.key});

  @override
  State<LotsScreen> createState() => _LotsScreenState();
}

class _LotsScreenState extends State<LotsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return Stack(
              children: [
                Expanded(
                    child: GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: lots_list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) {
                    final lot = lots_list[index];
                    return CardLot(lot: lot);
                  },
                )),
                //FloatingActionButton alignment right
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FloatingActionButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, '/create_lot'),
                      },
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
}
