import 'package:flutter/material.dart';


class MyGaragePage2 extends StatefulWidget {
  MyGaragePage2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyGaragePage2 createState() => _MyGaragePage2();
}

class _MyGaragePage2 extends State<MyGaragePage2> {
   List<DropdownMenuItem<String>> listDrop = [];
  String selected;

  DateTime pickedDate;
  TimeOfDay time;
  TimeOfDay time2;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    time2 = TimeOfDay.now();
  }

   void loadData(){
    listDrop = [];
    listDrop.add(DropdownMenuItem(
      child: Text(
        'ไปหาถึงที่ได้'),
        value: "1",)
    );
    listDrop.add(DropdownMenuItem(
      child: Text(
        'เฉพาะที่อู่เท่านั้น'),
        value: "2",)
    );
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                    Row(
                      children: <Widget> [
                         Expanded(
                        child: Text('เบอร์โทร', textAlign: TextAlign.center,style: TextStyle(color: Colors.black ,fontSize: 18),),),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                        ),
                      )
                      ],
                    ),

                   Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget> [
                   SizedBox(height: 2,),
                    Text('วันที่ทำการ', style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),),

                    ListTile(
                      title: Text('วัน: ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}',style: TextStyle(color: Colors.black, fontSize: 15,),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: _pickDate,
                    ),

                    ListTile( 
                      title: Text('ตั้งแต่: ${time.hour}:${time.minute}น.',style: TextStyle(color: Colors.black, fontSize: 15,),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: _pickTime,
                    ),
                     ListTile( 
                      title: Text('ถึง: ${time2.hour}:${time2.minute}น.',style: TextStyle(color: Colors.black, fontSize: 15,),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      onTap: _pickTime,
                    ),

                    Row(
                      children: [
                       Expanded(
                        child: Text('ที่ตั้ง', textAlign: TextAlign.center,style: TextStyle(color: Colors.black ,fontSize: 15),),),
                       Expanded(
                        child: Icon(Icons.add_location,size: 40, color: Colors.black),)
                    ],),

                    Row(
                      children: [
                       Expanded(
                        child: Text('ค่าบริการเริ่มต้น', textAlign: TextAlign.center,style: TextStyle(color: Colors.black ,fontSize: 15),),),
                       Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                        ),),
                       Expanded(
                        child: Text('บาท', textAlign: TextAlign.center,style: TextStyle(color: Colors.black ,fontSize: 15),),),
                    ],),

                   Row(
                     children: <Widget> [
                     Text('รูปแบบการบริการ', textAlign: TextAlign.center,style: TextStyle(color: Colors.black ,fontSize: 15),),
                     Container(
                       margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Container(
                        child: DropdownButton(
                          value: selected,
                          items: listDrop,
                          hint: Text('เลือก'),
                          onChanged: (value){
                            selected = value;
                            setState(() {
                              
                            });
                          }
                    )
                    )
                    ),
                   ],),
                    
                    Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                  Container(
                    margin: EdgeInsets.fromLTRB(140, 50, 0, 0),
                    child: RaisedButton(
                    onPressed: () {},
                    color: Colors.green[300],
                    child: Text('ต่อไป' ,style: TextStyle(color: Colors.white),),
                    
                    )
                  ),
                ],  
              )
                   ]
                )
                    ]
        )
      )
        );
  }
  _pickDate() async{
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year-5),
      lastDate: DateTime(DateTime.now().year+5),
      initialDate: pickedDate,
      );

      if(date != null )
      setState(() {
        pickedDate = date;
      }); 
  }
  _pickTime() async{
    TimeOfDay t,t2 = await showTimePicker(
      context: context,
      initialTime: time
      ) ;
      if(t != null )
      setState(() {
        time = t;
      });
       if(t2 != null )
      setState(() {
        time2 = t2;
      });
  }
}