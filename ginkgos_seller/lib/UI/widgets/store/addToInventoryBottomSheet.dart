import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ginkgos_seller/UI/constant/inputdeco.dart';
import 'package:ginkgos_seller/UI/widgets/customLoadingBar.dart';
import 'package:ginkgos_seller/UI/widgets/customSnackBar.dart';
import 'package:ginkgos_seller/UI/widgets/store/selectWidget.dart';
import 'package:ginkgos_seller/backend/addToInventory.dart';
import 'package:ginkgos_seller/backend/models/uncompletedInventoryProduct.dart';

class AddToInventory extends StatefulWidget {
  final String name;
  final String id;

  AddToInventory({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  _AddToInventoryState createState() => _AddToInventoryState();
}

class _AddToInventoryState extends State<AddToInventory> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String? _height;
  late String? _diameter;
  late TextEditingController _sellingPrice;

  late bool _inStock;
  @override
  void initState() {
    _sellingPrice = TextEditingController();
    _inStock = false;
    _height = null;
    _diameter = null;
    super.initState();
  }

  @override
  void dispose() {
    _sellingPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
              key: _formKey,
              child: Wrap(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(widget.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SelectWidget(
                      type: SelectWidget.height,
                      callback: (value) {
                        _height = value;
                      },
                    ),
                    SelectWidget(
                      type: SelectWidget.diameter,
                      callback: (value) {
                        _diameter = value;
                      },
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _sellingPrice,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                        },
                        decoration:
                            kFormInputDeco.copyWith(hintText: 'Selling Price')),
                    SwitchListTile(
                      title: Text('In Stock'),
                      onChanged: (bool value) {
                        setState(() {
                          _inStock = value;
                        });
                      },
                      value: _inStock,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        onPressed: () async {
                          if (_height != null && _diameter != null) {
                            if (_formKey.currentState!.validate()) {
                              LoadingBar.createLoading(context);
                              _formKey.currentState!.save();
                              var response = await addToInventory(
                                  IncompleteInventoryProduct(
                                      height: _height!,
                                      diameter: _diameter!,
                                      sellingPrice: _sellingPrice.text,
                                      inStock: _inStock ? '1' : '0',
                                      id: widget.id),
                                  FirebaseAuth.instance.currentUser!.email!
                                      .split('@')[0]);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              CustomSnackWidgets.buildErrorSnackBar(
                                  context,
                                  response.statusCode != 200
                                      ? 'An Error Occurred'
                                      : response.body == 'Already Exists'
                                          ? 'Item Already Exists'
                                          : 'Item Added Successfully');
                            }
                          } else {
                            print('pressed');
                            CustomSnackWidgets.buildErrorSnackBar(
                                context, 'Height and Diameter Required');
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ))
                  ]))),
    );
  }
}
