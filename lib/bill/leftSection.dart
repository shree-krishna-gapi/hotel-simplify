import 'package:flutter/material.dart';
class LeftSection extends StatefulWidget {
  @override
  _LeftSectionState createState() => _LeftSectionState();
}

class _LeftSectionState extends State<LeftSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Table(
        children: [
          TableRow(
              children: [Text('Sub Amount: '), Text('1780.00')]),
          TableRow(children: [
            Divider(),
            Divider(),
          ]),
          TableRow(children: [
            Text('Discounted Amount: '),
            Text('0.00')
          ]),
          TableRow(children: [
            Divider(),
            Divider(),
          ]),
          TableRow(
              children: [Text('Basic Amount: '), Text('1780.00')]),
          TableRow(children: [
            Divider(
              color: Colors.black,
            ),
            Divider(
              color: Colors.black,
            )
          ]),
          TableRow(children: [
            Text('Service Charge(+10%): '),
            Text('178.00')
          ]),
          TableRow(children: [
            Divider(),
            Divider(),
          ]),
          TableRow(children: [Text('VAT(+13%): '), Text('254.54')]),
          TableRow(children: [
            Divider(
              color: Colors.black,
            ),
            Divider(
              color: Colors.black,
            )
          ]),
          TableRow(
              children: [Text('Total Amount: '), Text('2212.54')]),
        ],
      ),
    );
  }
}
