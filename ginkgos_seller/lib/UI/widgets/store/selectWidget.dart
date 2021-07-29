import 'package:flutter/material.dart';

class SelectWidget extends StatefulWidget {
  static String height = 'height';
  static String diameter = 'diameter';
  final String type;
  final callback;

  const SelectWidget({
    Key? key,
    required this.type,
    this.callback,
  }) : super(key: key);

  @override
  _SelectWidgetState createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  late int index;

  @override
  void initState() {
    index = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(widget.type == SelectWidget.height ? 'Height' : 'Diameter'),
      SizedBox(height: 5),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(children: [
          ElevatedButton(
              child: Text('S',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                setState(() {
                  index = 0;
                });
                widget.callback(widget.type == SelectWidget.height
                    ? '0-3 feet'
                    : '0-5 inch');
              },
              style: ButtonStyle(
                  // shape: MaterialStateProperty.all(CircleBorder()),
                  backgroundColor: MaterialStateProperty.all(
                      index == 0 ? Colors.blue : Colors.white))),
          Text(widget.type == SelectWidget.height ? '0-3 feet' : '0-5 inch',
              style: TextStyle(fontSize: 12, color: Colors.grey))
        ]),
        Column(children: [
          ElevatedButton(
              child: Text('M ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                widget.callback(widget.type == SelectWidget.height
                    ? '3-6 feet'
                    : '5-9 inch');
                setState(() {
                  index = 1;
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      index == 1 ? Colors.blue : Colors.white))),
          Text(widget.type == SelectWidget.height ? '3-6 feet' : '5-9 inch',
              style: TextStyle(fontSize: 12, color: Colors.grey))
        ]),
        Column(children: [
          ElevatedButton(
              child: Text('L ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                setState(() {
                  index = 2;
                });
                widget.callback(widget.type == SelectWidget.height
                    ? 'Above 6 feet'
                    : 'Above 10 inc');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      index == 2 ? Colors.blue : Colors.white))),
          Text(
              widget.type == SelectWidget.height
                  ? 'Above 6 feet'
                  : 'Above 10 inc',
              style: TextStyle(fontSize: 12, color: Colors.grey))
        ])
      ])
    ]);
  }
}
