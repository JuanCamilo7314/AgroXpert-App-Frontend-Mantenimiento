import 'package:flutter/material.dart';
import '../services/final_report_api.dart';
import '../models/final_production_model.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:agroxpert/utils/date_convert.dart';

class AccordionFinalProduction extends StatefulWidget {
  final String idFinalProduction;
  const AccordionFinalProduction(
      {super.key, required this.idFinalProduction});
  @override
  State<AccordionFinalProduction> createState() => _AccordionFinalProduction();
}

class _AccordionFinalProduction extends State<AccordionFinalProduction> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFinalReportProduction(widget.idFinalProduction),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final finalProduction = snapshot.data as FinalProductionModel;
        return Card(
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            ListTile(
              title: const Text(
                'Reporte de producción final',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: Icon(
                    _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    _showContent = !_showContent;
                  });
                },
              ),
            ),
            _showContent
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: _contentAccordion(finalProduction),
                  )
                : Container()
          ]),
        );
      },
    );
  }
}

Widget _contentAccordion(FinalProductionModel finalProduction) {
  return Column(
    children: [
      _fieldFinalDateProduction(finalProduction.date),
      const SizedBox(height: 10),
      _fieldTotalProduction(finalProduction.totalProduction),
      const SizedBox(height: 10),
      _fieldExportMarket(finalProduction.exportMarket),
      const SizedBox(height: 10),
      _fieldNationalMarket(finalProduction.waste),
      const SizedBox(height: 10),
      _fieldWaste(finalProduction.waste),
      const SizedBox(height: 20),
      _tableCaliberDivision(finalProduction.caliberDivision),
    ],
  );
}

Widget _fieldFinalDateProduction(DateTime date) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(FlutterIcons.calendar_ant, color: Colors.green),
      const SizedBox(width: 8),
      const Text('Fecha:',
          style: TextStyle(fontWeight: FontWeight.bold)),
      Text(dateOnly(date)),
    ],
  );
}

Widget _fieldTotalProduction(double totalProduction) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(FlutterIcons.boxes_faw5s, color: Colors.green),
      const SizedBox(width: 8),
      const Text('Total de producción: ',
          style: TextStyle(fontWeight: FontWeight.bold)),
      Text('$totalProduction Kg'),
    ],
  );
}

Widget _fieldExportMarket(double exportedMarket) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(FlutterIcons.earth_ant, color: Colors.green),
      const SizedBox(width: 8),
      const Text('Total Mercado Exportación:',
          style: TextStyle(fontWeight: FontWeight.bold)),
      Text('$exportedMarket Kg'),
    ],
  );
}

Widget _fieldNationalMarket(double nationalMarket) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(FlutterIcons.flag_ant, color: Colors.green),
      const SizedBox(width: 8),
      const Text('Total Mercado Nacional:',
          style: TextStyle(fontWeight: FontWeight.bold)),
      Text('$nationalMarket Kg'),
    ],
  );
}

Widget _fieldWaste(double waste) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(FlutterIcons.trash_2_fea, color: Colors.green),
      const SizedBox(width: 8),
      const Text('Desechado:',
          style: TextStyle(fontWeight: FontWeight.bold)),
      Text('$waste Kg'),
    ],
  );
}


Widget _tableCaliberDivision(List<CaliberDivision> calibersDivision) {
  int index = 1;
  return Table(
    border: TableBorder.all(
      color: Colors.grey.shade600,
      width: 1,
      style: BorderStyle.solid,
    ),
    children: [
      TableRow(
        decoration: BoxDecoration(
          color: Colors.orange.shade300,
          borderRadius: BorderRadius.circular(1.0),
        ),
        children: const [
          TableCell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Categoria',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Cantidad',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      for (CaliberDivision caliber in calibersDivision)
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(caliber.category),
              ),
            ),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${caliber.quantity} Kg',
              ),
            )),
          ],
        ),
    ],
  );
}

