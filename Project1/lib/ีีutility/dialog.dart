import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('icon/logo.png'),
        title: Text(
          'Normal Dialog',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(string),
      ),
      children: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
      ],
    ),
  );
}
