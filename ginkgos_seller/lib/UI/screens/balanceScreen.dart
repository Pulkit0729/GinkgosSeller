import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  static String id = 'BalanceScreen';
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Balance')),
        body: ListView(children: [
          BalanceCard(),
          Divider(thickness: 1),
          ListTile(title: Text('Payment Status')),
          ListTile(
            title: Text('Last Week'),
            subtitle: Text('Rs 200'),
            trailing: Text('Paid'),
          ),
          ListTile(
              title: Text('View Previous'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ))
        ]));
  }
}

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.grey)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Today', style: TextStyle(color: Colors.white)),
                  Text('Rs 400',
                      style: TextStyle(fontSize: 17, color: Colors.white)),
                  Text('2 Orders', style: TextStyle(color: Colors.white))
                ]),
            padding: EdgeInsets.all(10),
          ),
          Divider(thickness: 1),
          Container(
              padding: EdgeInsets.all(10),
              child: IntrinsicHeight(
                  child: Row(children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Text('This Week', style: TextStyle(color: Colors.white)),
                      Text('Rs 400',
                          style: TextStyle(fontSize: 17, color: Colors.white)),
                      Text('20 Orders', style: TextStyle(color: Colors.white))
                    ])),
                VerticalDivider(thickness: 1),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Text('This Month', style: TextStyle(color: Colors.white)),
                      Text('Rs 400',
                          style: TextStyle(fontSize: 17, color: Colors.white)),
                      Text('200 Orders', style: TextStyle(color: Colors.white))
                    ]))
              ])))
        ]));
  }
}
