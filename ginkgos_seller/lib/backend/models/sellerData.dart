import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SellerData {
  final String name;
  final String nurseryName;
  final String phone;
  final String email;
  final String address;

  SellerData({
    required this.name,
    required this.phone,
    required this.email,
    required this.nurseryName,
    required this.address,
  });
}

Future<SellerData> getSellerData() async {
  final _sellers = FirebaseFirestore.instance.collection('Sellers');
  return await _sellers
      .doc(FirebaseAuth.instance.currentUser!.email!.split('@')[0])
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      try {
        dynamic nestedName = documentSnapshot.get(FieldPath(['Name']));
        dynamic nestedPhone = documentSnapshot.get(FieldPath(['Phone']));
        dynamic nestedEmail = documentSnapshot.get(FieldPath(['Email']));
        dynamic nestedAddress = documentSnapshot.get(FieldPath(['Address']));
        dynamic nestedNursery =
            documentSnapshot.get(FieldPath(['NurseryName']));
        return SellerData(
            name: nestedName,
            phone: nestedPhone,
            email: nestedEmail,
            nurseryName: nestedNursery,
            address: nestedAddress);
      } on StateError catch (e) {
        return Future.value(SellerData(
            name: '', phone: '', email: '', nurseryName: '', address: ''));
      }
    } else {
      return Future.value(SellerData(
          name: '', phone: '', email: '', nurseryName: '', address: ''));
    }
  });
}
