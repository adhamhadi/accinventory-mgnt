
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../qrscreens/readqr.dart';
import '../main_menu.dart';
import 'final_ivoice.dart';
import 'header_widget.dart';



class chooseproducts extends StatelessWidget{
   var qrstr='lets scan it !';
  String name;
  final int value1=10123456789;
   chooseproducts({
    Key ?key,
    required this.name,
  }):super(key: key,);



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body:SingleChildScrollView(child:

      Column(
        children:[
          Container(
            height: 100,
            child: const HeaderWidget(80,false,Icons.shopping_cart),
          ),


          Text(' : فاتورة بيع لـ\n${name}',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),
          Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(' :  قيمة الفاتورة',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                const Divider(),
                const SizedBox(height: 7.0,),
                Text(value1.toString()+'  :  قيمة الديون',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                const Divider(),
                const SizedBox(height: 7.0,),
                Text(value1.toString()+': المبلغ المستحق',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                const Divider(),
                const SizedBox(height: 40.0,),

              ],
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child:Text('تأكيد'.toUpperCase(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    onPressed:() {
                      Navigator.push(context,  MaterialPageRoute(builder: (context)=>finalInvoice(value:name ,)));
                    }
                ),
                //  SizedBox(width: 7.0,),
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
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child:Text('إضـافة'.toUpperCase(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    onPressed:() {Navigator.push(context,  MaterialPageRoute(builder: (context)=> ScanScreen()));}
                ),
                // SizedBox(width: 7.0,),
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
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child:Text('إلغـاء'.toUpperCase(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
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

              ]
          ),

        ],
      ),
      ),
    );
  }

}
