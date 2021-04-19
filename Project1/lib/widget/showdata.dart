import 'package:flutter/material.dart';

class Showdata extends StatelessWidget{

  static List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data!!!!!!'),
      ),
      body: ListView.builder(itemCount: data.length==0?0:data.length,
      itemBuilder: (BuildContext context,int index)
        {

          return new Card(
            child: Column(
              children: <Widget> [
                  // new Text(data[index]["c_Id"],style: TextStyle(),),
                  new Text(data[index]["c_Brand"],style: TextStyle(fontSize: 20),),
                  new Text(data[index]["c_Image"],style: TextStyle(fontSize: 20),),
                  // new Text(data[index]["c_Engine"],style: TextStyle(),),
                  // new Text(data[index]["c_Battery"],style: TextStyle(),),
                  // new Text(data[index]["c_Coolant"],style: TextStyle(),),
                  // new Text(data[index]["c_Fuel"],style: TextStyle(),),
                  // new Text(data[index]["c_AirConditioning"],style: TextStyle(),),
                  // new Text(data[index]["c_PowerTrain"],style: TextStyle(),),
                  // new Text(data[index]["c_Braking"],style: TextStyle(),),
                  
              ],
            ),
          );
        }
      )
    );
  }
}
  
