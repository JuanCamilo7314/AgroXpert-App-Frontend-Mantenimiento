import 'package:agroxpert/models/farm_lot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CardLot extends StatefulWidget {
  final FarmLotModel lot;
  const CardLot({super.key, required this.lot});

  @override
  State<CardLot> createState() => _CardLotState();
}

class _CardLotState extends State<CardLot> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Expanded(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.lot.nameLot,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            getRowInfoLot(FlutterIcons.tree_ent, " ${widget.lot.numberTrees}"),
            getRowInfoLot(
                FlutterIcons.calendar_ant, " ${widget.lot.treesAge} años"),
            getRowInfoLot(FlutterIcons.scale_balance_mco,
                " ${widget.lot.averageFruitWeight} g"),
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Cosechas"),
                  Icon(FlutterIcons.graph_sli),
                ],
              ),
              onPressed: () => {
                Navigator.of(context)
                    .pushNamed('/harvests', arguments: widget.lot.id)
              },
            ),
          ],
        ),
      )),
    );
  }

  Widget getRowInfoLot(IconData icon, String text) {
    return Row(
      children: [Icon(icon), Text(text)],
    );
  }
}
