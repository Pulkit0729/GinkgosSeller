import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/screens/inventoryAndStore.dart';
import 'package:ginkgos_seller/UI/widgets/customLoadingBar.dart';
import 'package:ginkgos_seller/UI/widgets/customSnackBar.dart';
import 'package:ginkgos_seller/backend/models/inventoryProduct.dart';
import 'package:ginkgos_seller/backend/updateProduct.dart';
import 'package:ginkgos_seller/main.dart';

class InventoryProductDescription extends StatefulWidget {
  static String id = 'inventoryProductDescription';
  final InventoryProduct inventoryProduct;
  const InventoryProductDescription({Key? key, required this.inventoryProduct})
      : super(key: key);

  @override
  _InventoryProductDescriptionState createState() =>
      _InventoryProductDescriptionState();
}

class _InventoryProductDescriptionState
    extends State<InventoryProductDescription> {
  late bool _value;
  late String _sp;
  @override
  void initState() {
    _value = widget.inventoryProduct.inStock == '0' ? false : true;
    _sp = widget.inventoryProduct.sellingPrice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          settings: RouteSettings(
              arguments: ScreenArguments(type: InventoryAndStore.inventory)),
          pageBuilder: (context, animation, secondaryAnimation) =>
              InventoryAndStore(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        ));
        return true;
      },
      child: Scaffold(
          appBar: AppBar(),
          body: ListView(children: [
            Stack(fit: StackFit.passthrough, children: [
              CarouselSlider(
                  items: widget.inventoryProduct.images
                      .map((e) => GestureDetector(child: Image.network(e)))
                      .toList(),
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.5,
                      viewportFraction: 1))
            ]),
            Container(
                margin: EdgeInsets.only(top: 4),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
                child: Column(children: [
                  Text(widget.inventoryProduct.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Row(children: [
                    Expanded(flex: 5, child: Text('In Stock')),
                    Expanded(
                        flex: 2,
                        child: SwitchListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding: EdgeInsets.zero,
                            value: _value,
                            onChanged: (bool value) async {
                              LoadingBar.createLoading(context);
                              var response = await updateInstock(
                                  inStock: value ? '1' : '0',
                                  itemId: widget.inventoryProduct.itemId);
                              if (response.statusCode == 200) {
                                Navigator.pop(context);
                                setState(() {
                                  _value = value;
                                });
                                CustomSnackWidgets.buildErrorSnackBar(
                                    context,
                                    value
                                        ? 'Added Successfully'
                                        : 'Removed Successfully');
                              } else {
                                Navigator.pop(context);
                                CustomSnackWidgets.buildErrorSnackBar(
                                    context, 'Error Occurred');
                              }
                            }))
                  ]),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Selling Price', style: TextStyle(fontSize: 17)),
                        Text(_sp, style: TextStyle(fontSize: 17))
                      ]),
                  Divider(thickness: 1),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Height', style: TextStyle(fontSize: 17)),
                        Text(widget.inventoryProduct.height,
                            style: TextStyle(fontSize: 17))
                      ]),
                  Divider(thickness: 1),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Diameter', style: TextStyle(fontSize: 17)),
                        Text(widget.inventoryProduct.diameter,
                            style: TextStyle(fontSize: 17))
                      ]),
                  Divider(thickness: 1),
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ChangeSP(
                                  int.parse(
                                      widget.inventoryProduct.sellingPrice),
                                  widget.inventoryProduct.itemId, (value) {
                                setState(() {
                                  _sp = value;
                                });
                              });
                            });
                      },
                      child: Text('Edit'))
                ]))
          ])),
    );
  }
}

class ChangeSP extends StatefulWidget {
  final int currentPrice;
  final String id;
  final callback;
  const ChangeSP(this.currentPrice, this.id, this.callback);
  @override
  _ChangeSPState createState() => _ChangeSPState();
}

class _ChangeSPState extends State<ChangeSP> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _sp;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _sp = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _sp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: AlertDialog(
            title: TextFormField(
              controller: _sp,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                } else {
                  if (int.parse(value) - widget.currentPrice <= 20) {
                  } else {
                    return 'Cannot increase more than 20';
                  }
                }
              },
              decoration: InputDecoration(hintText: 'New Selling Price'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      LoadingBar.createLoading(context);
                      _formKey.currentState!.save();
                      var response = await updateSellingPrice(
                          sellingPrice: _sp.text, itemId: widget.id);
                      if (response.statusCode == 200) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        widget.callback(_sp.text);
                        CustomSnackWidgets.buildErrorSnackBar(
                            context, 'Changed Successfully');
                      } else {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        CustomSnackWidgets.buildErrorSnackBar(
                            context, 'Error Occurred');
                      }
                    }
                  },
                  child: Text('Submit'))
            ]));
  }
}
