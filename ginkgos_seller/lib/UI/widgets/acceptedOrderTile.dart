import 'package:flutter/material.dart';
import 'package:ginkgos_seller/backend/models/orderObject.dart';

import 'commonOrderTile.dart';

class AcceptedTile extends StatelessWidget {
  final Order order;
  const AcceptedTile({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 4),
        padding: EdgeInsets.only(left: 20, right: 20, top: 18),
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.grey[300]!)),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CommonOrderTile(order: order),
          SizedBox(height: 5),
          Text(
            'Status : Ready to Pick',
            style: TextStyle(fontSize: 16),
          )
        ]));
  }
}
