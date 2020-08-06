import 'package:flutter/material.dart';

class showTimeCard extends StatefulWidget {
  @override
  _showTimeCardState createState() => _showTimeCardState();
}

class _showTimeCardState extends State<showTimeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: ListTile(
        leading: Icon(Icons.location_on),
        // title: Text('$addressTtitle'),
        // subtitle: Text('$addressSnippet'),
      ),
    );
  }
}
