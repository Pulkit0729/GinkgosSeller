import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/UI/widgets/acceptedOrderTile.dart';
import 'package:ginkgos_seller/backend/models/orderObject.dart';

class AcceptedOrdersScreen extends StatelessWidget {
  const AcceptedOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Sellers')
            .doc(FirebaseAuth.instance.currentUser!.email!.split('@')[0])
            .collection('IdCollection')
            .doc('Accepted')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return SpinKitCircle(color: kLoadingColor);
          }
          final orders = snapshot.data!.data()!.values;
          List<String> ids = [];
          for (var id in orders) {
            ids.add(id);
          }
          return FutureBuilder(
              future: retrieveOrders(ids),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Order>> snapshot1) {
                if (snapshot1.connectionState == ConnectionState.done) {
                  if (snapshot1.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot1.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AcceptedTile(order: snapshot1.data![index]);
                      },
                    );
                  } else {
                    return Text('Check Connection');
                  }
                } else {
                  return SpinKitCircle(color: kLoadingColor);
                }
              });
        });
  }
}
