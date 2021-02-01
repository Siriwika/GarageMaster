import 'package:flutter/material.dart';

import 'Mygarage2.dart';

class MyGaragePage  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child: Container(
        margin: EdgeInsets.all(10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget> [
                   SizedBox(height: 2,),
                    Text('อู่ของฉัน', style: TextStyle(color: Colors.black, fontSize: 30,fontWeight: FontWeight.bold),),

                Container(  
                  margin: EdgeInsets.all(30),                         
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget> [
                      RaisedButton(
                        onPressed: () {},
                        child: Icon(Icons.add,size: 40, color: Colors.white),)
                     ],
                    )
                  ),

                 Container(   
                  margin: EdgeInsets.fromLTRB(0, 20, 50, 5),                        
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget> [
                      Expanded(
                        child: Text('ชื่อร้าน', textAlign: TextAlign.center,style: TextStyle(color: Colors.black ,fontSize: 15,fontWeight: FontWeight.bold),),),
                      Expanded(
                        child: TextField(),
                      )],
                    )
                  ),

         Container(
               padding: EdgeInsets.all(5),
               margin: EdgeInsets.fromLTRB(30, 30, 30, 5),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget> [
                   SizedBox(height: 2,),
                    Text('คำบรรยาย', style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),),
                   TextField(),
                 ]
               )
        ),

        Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                  Container(
                    margin: EdgeInsets.fromLTRB(120, 50, 50, 0),
                    child: RaisedButton(
                    onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => MyGaragePage2() ));},
                    color: Colors.green[300],
                    child: Text('ยืนยัน' ,style: TextStyle(color: Colors.white),),
                    
                    )
                  ),
                ],  
              )
        ]
      )
    )
    )
    );
  }
}