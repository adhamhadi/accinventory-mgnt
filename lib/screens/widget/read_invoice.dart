
import 'package:flutter/material.dart';
import 'package:flutter_scanner2/screens/widget/header_widget.dart';


import '../main_menu.dart';


class readInvoice extends StatelessWidget{
  final String value;
  final int value1=10123456789;
  const readInvoice({
    Key ?key,
    required this.value,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body:SingleChildScrollView(child:

      Column(
        children:[
          Container(
            height: 90,
            child: HeaderWidget(90,false,Icons.message_sharp),
          ),


          Text(' : فاتورة بيع لـ'+'\n'+value,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),


          Container(
            padding: EdgeInsets.all(30),
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(' :  قيمة الفاتورة',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                Divider(),
                SizedBox(height: 7.0,),
                Text(value1.toString()+'  :  قيمة الديون',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                Divider(),
                SizedBox(height: 7.0,),
                Text(value1.toString()+': المبلغ المستحق',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                Divider(),
                SizedBox(height: 40.0,),

              ],
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ElevatedButton(
                    style:  ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                      elevation: MaterialStateProperty.all(4),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),

                        ),
                      ),
                    ),
                    child:Padding(
                      padding: EdgeInsets.all(10),
                      child:Text('تم'.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    onPressed:() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => menuPage()
                          ),
                          ModalRoute.withName("/Home"));
                    }
                ),
                //  SizedBox(width: 7.0,),

              ]
          ),

        ],
      ),
      ),
    );
  }
}