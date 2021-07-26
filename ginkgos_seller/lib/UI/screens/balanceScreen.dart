import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  static String id = 'BalanceScreen';
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Balance')),
      body: ListView(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.red[200],
                  border: Border.all(color: Colors.grey)),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("This Week's balance", style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20),
                    Text('2000Rs',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.green,
                            fontWeight: FontWeight.bold))
                  ])),
        ],
      ),
    );
  }
}
