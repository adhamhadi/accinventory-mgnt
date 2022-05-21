
import 'package:flutter/material.dart';
import 'package:flutter_scanner2/screens/widget/read_invoice.dart';
import 'package:flutter_scanner2/screens/widget/header_widget.dart';
import 'Sale_invoice.dart';


import '../main_menu.dart';
import 'Sale_invoice.dart';
import 'header_widget.dart';

class finalInvoice extends StatelessWidget {
  final String value;
  final int value1=10123456789;
  const finalInvoice({
    Key ?key,
    required this.value,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      backgroundColor: Colors.white,
      body:SingleChildScrollView(child:

      Column(

        children:[
          Container(
            height: 200,
            child: const HeaderWidget(200,false,Icons.print),

          ),


          Text(' : فاتورة بيع لـ'+'\n'+value,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),



          Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 3.0)
               ),
            //alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                const Text('  :  قيمة المشتريات',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                const Divider(),
                const SizedBox(height: 10.0,),
                const Text('  :  قيمة الديون',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                const Divider(),
                const SizedBox(height: 10.0,),
                const Text(':إجمالي المبلغ المستحق',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                const Divider(),
                const SizedBox(height: 10.0,),
                const Text(':إجمالي المبلغ المدفوع',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                const Divider(),
                const SizedBox(height: 10.0,),
                Text((value1*2).toString()+'  : المبلغ المتبقي',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                const Divider(),
                const SizedBox(height: 60.0,),
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
                      child:Text('رجوع'.toUpperCase(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    onPressed:() {
                      Navigator.pop(context,  MaterialPageRoute(builder: (context)=>SaleInvoice(value:value,)));
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
                      child:Text('إتمام'.toUpperCase(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    onPressed:() {
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>readInvoice(value:value ,)));
                    }
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

