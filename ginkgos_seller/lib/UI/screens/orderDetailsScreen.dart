import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';

class OrderDetailsScreen extends StatelessWidget {
  static String id = 'orderDetails';
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Details')),
      body: ListView(
        children: [
          Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
              child: ListTile(
                  leading: Text(
                    'Order Id',
                    textAlign: TextAlign.center,
                  ),
                  title: Text('#12121211212', style: TextStyle(fontSize: 13)))),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              ItemTile(),
              ItemTile(),
            ],
          )
        ],
      ),
      bottomNavigationBar: Row(children: [
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
                    onPressed: () {},
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
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        margin: EdgeInsets.only(top: 4),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              flex: 5,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                    flex: 3,
                    child: Container(
                        margin: EdgeInsets.only(left: 10, bottom: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text('Item1'),
                                    Text('Croton'),
                                    SizedBox(height: 7),
                                    Text('Size'),
                                    Text('Qty'),
                                    SizedBox(height: 7),
                                  ]),
                              SizedBox(width: 20),
                            ]))),
                Expanded(
                    flex: 2,
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset('images/product.jpeg')))
              ])),
          Expanded(flex: 1, child: Container())
        ]));
  }
}
