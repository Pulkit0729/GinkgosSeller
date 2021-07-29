import 'package:flutter/material.dart';
import 'package:ginkgos_seller/backend/models/orderObject.dart';

class ItemTile extends StatelessWidget {
  final OrderItem orderItem;
  const ItemTile({Key? key, required this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          '${orderItem.qty} x ${orderItem.name}',
          style: TextStyle(fontSize: 16),
        ),
        Text('Rs${orderItem.price}')
      ]),
    );
  }
}

class CommonOrderTile extends StatelessWidget {
  final Order order;
  const CommonOrderTile({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num sum = 0;
    for (var o in order.orderItems) {
      sum = sum + double.parse(o.price);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Id : ${order.orderId}'),
          Text(order.orderDate.split(' ')[0])
        ]),
        Divider(thickness: 1),
        SizedBox(height: 7),
        ListView.builder(
            shrinkWrap: true,
            itemCount: order.orderItems.length,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, int index) {
              return ItemTile(orderItem: order.orderItems[index]);
            }),
        SizedBox(height: 5),
        Divider(thickness: 1),
        SizedBox(height: 5),
        Text('Total : ${sum.toString()} ', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
