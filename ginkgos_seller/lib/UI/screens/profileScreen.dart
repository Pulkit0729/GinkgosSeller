import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ginkgos_seller/UI/screens/login_screen.dart';
import 'package:ginkgos_seller/backend/models/sellerData.dart';

class ProfileScreen extends StatelessWidget {
  static String id = 'profileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Profile')),
        body: FutureBuilder(
          future: getSellerData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView(children: [
                Container(
                    padding: EdgeInsets.only(
                        top: 20, right: 15, left: 15, bottom: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]!))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(snapshot.data.name,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700)),
                          CircleAvatar(
                              backgroundColor: Colors.green, radius: 40)
                        ])),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!)),
                  child: ListTile(
                    leading:
                        Text('Nursery Name', style: TextStyle(fontSize: 18)),
                    trailing: Text(snapshot.data.nurseryName,
                        style: TextStyle(fontSize: 17)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!)),
                  child: ListTile(
                    leading: Text('Phone', style: TextStyle(fontSize: 18)),
                    trailing: Text(snapshot.data.phone,
                        style: TextStyle(fontSize: 17)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!)),
                  child: ListTile(
                    leading: Text('Email', style: TextStyle(fontSize: 18)),
                    trailing: Text(snapshot.data.email,
                        style: TextStyle(fontSize: 17)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!)),
                  child: ListTile(
                    leading: Text('Address', style: TextStyle(fontSize: 18)),
                    trailing: Text(snapshot.data.address,
                        style: TextStyle(fontSize: 17)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!)),
                  child: ListTile(
                    onTap: () {
                      FirebaseAuth.instance.signOut().then((value) =>
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginScreen.id, (route) => false));
                    },
                    leading: Icon(Icons.logout),
                    title: Text('Logout', style: TextStyle(fontSize: 17)),
                  ),
                ),
              ]);
            } else {
              return SpinKitCircle(
                color: Colors.blue,
              );
            }
          },
        ));
  }
}
