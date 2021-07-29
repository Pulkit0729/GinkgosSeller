import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/backend/changeStatus.dart';
import 'package:ginkgos_seller/backend/models/orderObject.dart';

import 'commonOrderTile.dart';

class NewOrderTile extends StatelessWidget {
  final Order order;
  const NewOrderTile({Key? key, required this.order}) : super(key: key);

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
          Row(children: [
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.grey.shade300))),
                        onPressed: () {},
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'CANCEL',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ])))),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextButton(
                        onPressed: () {
                          acceptOrders(order.orderId);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kSecondaryColor)),
                        child: Text(
                          'ACCEPT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ))))
          ]),
        ]));
  }
}
