import 'package:flutter/material.dart';

customDialog({required BuildContext context, required String title, required Widget content, required List<Widget> action}) async{
 return showDialog(context: context, builder: (_) {
   return AlertDialog(
     title: Text(title),
     content: content,
     actions: action,
   );
 }
 );
}
