import 'package:flutter/material.dart';

class Mystyle {
  // ignore: non_constant_identifier_names
  Widget Buttontype(String name) => RaisedButton(
        onPressed: () {},
        color: Color.fromRGBO(84, 198, 214, 1),
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      );

  Mystyle();
}
