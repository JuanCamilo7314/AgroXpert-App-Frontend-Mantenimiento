import 'package:agroxpert/models/estimates_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:agroxpert/utils/date_convert.dart';
import '../models/estimates_model.dart';

class AccordionEstimates extends StatefulWidget {
  final EstimatesModel estimate;
  final int index;

  const AccordionEstimates(
      {super.key, required this.estimate, required this.index});
  @override
  State<AccordionEstimates> createState() => _AccordionEstimates();
}

class _AccordionEstimates extends State<AccordionEstimates> {
  // Show or hide the content
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        // The title
        ListTile(
          title: _titelAccordion(widget.estimate.date, widget.index),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //child: _contentAccordion(widget.estimate),
              )
            : Container()
      ]),
    );
  }
}

Widget _titelAccordion(DateTime date, int index) {
  return Text(
    'Estimación #$index ${dateOnly(date)}',
    style: const TextStyle(fontWeight: FontWeight.bold),
  );
}
