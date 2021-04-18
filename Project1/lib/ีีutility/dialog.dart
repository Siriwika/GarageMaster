import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<Null> normalDialog(
    BuildContext context, String string1, String string2) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        title: Text(
          string1,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(string2),
      ),
      children: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
      ],
    ),
  );
}
