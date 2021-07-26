import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/UI/screens/orderDetailsScreen.dart';
import 'package:ginkgos_seller/backend/models/newOrderObject.dart';

class OrderTile extends StatelessWidget {
  final Order newOrder;
  const OrderTile({Key? key, required this.newOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OrderDetailsScreen.id);
      },
      child: Container(
          margin: EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]!)),
          padding: EdgeInsets.only(left: 10, right: 10, top: 18),
          child: Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Order id'), Text(newOrder.orderId)]),
            SizedBox(height: 7),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Order date'), Text(newOrder.orderDate)]),
            SizedBox(height: 7),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Order total'), Text('140')]),
            SizedBox(height: 7),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Status'), Text(newOrder.status)]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Click to View Details',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ])),
    );
  }
}
