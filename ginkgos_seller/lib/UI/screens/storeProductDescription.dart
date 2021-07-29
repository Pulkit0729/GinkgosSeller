import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/UI/widgets/store/addToInventoryBottomSheet.dart';
import 'package:ginkgos_seller/backend/models/storeProduct.dart';

class StoreProductDescription extends StatelessWidget {
  static String id = 'storeProductDescription';
  final StoreProduct storeProduct;
  const StoreProductDescription({Key? key, required this.storeProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kStoreColor,
      ),
      body: ListView(children: [
        Stack(
          fit: StackFit.passthrough,
          children: [
            CarouselSlider(
                items: storeProduct.images
                    .map((e) => GestureDetector(child: Image.network(e)))
                    .toList(),
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.5,
                    viewportFraction: 1)),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  storeProduct.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text('  ${storeProduct.short}',
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
        Container(
            margin: EdgeInsets.only(top: 4),
            padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Description',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                Text(storeProduct.description),
              ],
            ))
      ]),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: TextButton(
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)),
              backgroundColor: MaterialStateProperty.all(kSecondaryColor)),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return AddToInventory(
                      name: storeProduct.name, id: storeProduct.id);
                });
          },
          child: Text(
            'Add to inventory',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
