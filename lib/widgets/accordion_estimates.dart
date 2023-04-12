import 'package:flutter/material.dart';

class AccordionEstimates extends StatefulWidget {
  final String title;
  final String content;

  const AccordionEstimates({Key? key, required this.title, required this.content})
      : super(key: key);
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
          title: const Text(
            'Estimacion #1 03/03/2021',
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Text(widget.content),
              )
            : Container()
      ]),
    );
  }
}