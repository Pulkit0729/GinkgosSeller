import 'package:flutter/material.dart';

InputDecoration kTextInputDeco = InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    filled: true,
    fillColor: Colors.white);

InputDecoration kFormInputDeco = InputDecoration(
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!)),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)));
