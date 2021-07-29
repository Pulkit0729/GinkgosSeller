import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> acceptOrders(String orderId) async {
  await FirebaseDatabase.instance
      .reference()
      .child('OrdersV2')
      .child(orderId.toString())
      .child('Status')
      .set('Accepted')
      .then((value) => {});
  var colRef = FirebaseFirestore.instance
      .collection('Sellers')
      .doc(FirebaseAuth.instance.currentUser!.email!.split('@')[0])
      .collection('IdCollection');
  await colRef
      .doc('New')
      .update({orderId: FieldValue.delete()})
      .then((value) => print("User's Property Deleted"))
      .catchError((error) => print("Failed to delete user's property: $error"));
  await colRef
      .doc('Accepted')
      .set({orderId: orderId}, SetOptions(merge: true))
      .then((value) => true)
      .onError((error, stackTrace) => false);
}
