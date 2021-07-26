import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';

class HelpScreen extends StatelessWidget {
  static String id = 'helpScreen';
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
                onTap: () async {},
                leading: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey[200]!,
                    child: Icon(Icons.chat_outlined, color: kSecondaryColor)),
                title: Text('Chat With Us')),
            ListTile(
              leading: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[200]!,
                  child: Icon(Icons.phone, color: kSecondaryColor)),
              title: Text('Contact Us'),
              onTap: () async {},
            )
          ],
        ),
      ),
    );
  }
}
