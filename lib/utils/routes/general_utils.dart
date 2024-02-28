import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static void snakBarmessage(String message, BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  static void changeFocus(
     BuildContext context, FocusNode current, FocusNode next
      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);

  }
}