import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/widgets/newOrderTile.dart';
import 'package:ginkgos_seller/backend/models/orderObject.dart';

class CompletedOrders extends StatelessWidget {
  static String id = 'CompletedOrders';
  const CompletedOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Completed')),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container();
          }),
    );
  }
}
