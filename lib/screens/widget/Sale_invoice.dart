
import 'package:flutter/material.dart';

import '../main_menu.dart';
import 'final_ivoice.dart';
import 'header_widget.dart';



class SaleInvoice extends StatelessWidget{
 final String value;
 final int value1=10123456789;
 const SaleInvoice({
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
                height: 200,
                child: const HeaderWidget(200,false,Icons.shopping_cart),
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child:Text('تأكيد'.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                        ),
                        onPressed:() {
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>finalInvoice(value:value ,)));
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child:Text('إضـافة'.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                        ),
                        onPressed:() {}
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child:Text('إلغـاء'.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
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
