import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_time_dialog/one_time_dialog.dart';

Future<Null> normalDialog(
    BuildContext context, String string1, String string2,int time) async {
  showDialog(
    context: context,
    builder: (context) => OneTimeDialog(
      amountOfTimesToShow: time,
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
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
      ],
      context: context,
      id: 'AUniqueID',
    ),
  );
}
