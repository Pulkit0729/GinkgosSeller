import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/widgets/newOrderTile.dart';
import 'package:ginkgos_seller/backend/models/orderObject.dart';

class OutForDelivery extends StatelessWidget {
  const OutForDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container();
        });
  }
}
