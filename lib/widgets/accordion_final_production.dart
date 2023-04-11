import 'package:flutter/material.dart';

class AccordionFinalProduction extends StatefulWidget {
  final String title;
  final String content;

  const AccordionFinalProduction({Key? key, required this.title, required this.content})
      : super(key: key);
  @override
  State<AccordionFinalProduction> createState() => _AccordionFinalProduction();
}

class _AccordionFinalProduction extends State<AccordionFinalProduction> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
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