import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_scanner2/screens/widget/choose_products.dart';
import 'package:http/http.dart' as http;
import '../main_menu.dart';
import 'Sale_invoice.dart';
import 'header_widget.dart';




class ChooseCustomer extends StatefulWidget {
  @override
  _ChooseCustomerState createState() => _ChooseCustomerState();
}

class _ChooseCustomerState extends State<ChooseCustomer> {
  double _headerHeight =220;
  List data =[];

  var items = [
    'Adham',
    'Rawad',
    'Alaa',
    'Mostafa',
    'Mohammed',
  ];
  @override
  void initState() {
    super.initState();
  //  fetchCustomers();

  }
  List<Customers> _customer = [];

  @override
  Widget build(BuildContext context) {
    String text;
    String text1;
    _customer = (data).map<Customers>((item) => Customers.fromJson(item)).toList();
    String _chosenValue='kkll';

    return Scaffold(
      backgroundColor: Colors.white,

      body:SingleChildScrollView(child:
      Column(
        children:[
        Container(
        height: _headerHeight,
        child: HeaderWidget(_headerHeight,true,Icons.person_add),

        ),
          const Center(
            child:Text('اختيـار زبـون',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
          ),
          Column(
            children: [

              DropdownButton(
                focusColor:Colors.white38,
                elevation: 4,
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                iconEnabledColor:Colors.black,
                items:_customer.map(( Customers item) {
                  return DropdownMenuItem(
                    value: item.name.toString(),
                    child: Text(item.name),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                hint: const Text("Choose Customer"),
                onChanged: (String? value) {
                  setState(() {
                    _chosenValue = value!;
                    //final index=_customer.indexWhere((element) => element.first_name==_chosenValue);
                    Navigator.push(context,  MaterialPageRoute(builder: (context)=>chooseproducts(name:_chosenValue,)));
                  });
               },
              ),

              SizedBox(height: 20.0,),
              ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(4),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
                  child:Padding(

                    padding: EdgeInsets.fromLTRB(40, 15, 40, 7),
                    child:Text(text1='زبون مفرق'.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  ),
                  onPressed:() {
                    Navigator.push(context,  MaterialPageRoute(builder: (context)=>chooseproducts(name:text1)));
                  }

              ),
              const SizedBox(height: 17.0,),
              ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(4),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
                  child:Padding(
                    padding: EdgeInsets.fromLTRB(40, 15, 40, 7),
                    child:Text(text='زبون جملة'.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  ),
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SaleInvoice(value:text)));
                  }

              ),
              SizedBox(height: 17.0,),
              ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(4),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
                  child:Padding(
                    padding: EdgeInsets.fromLTRB(40, 15, 40, 7),
                    child:Text('إنشاء زبون'.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  ),
                  onPressed:() {

                  }

              ),
              SizedBox(height: 17.0,),
              ElevatedButton(
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(5),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
                  child:const Padding(
                    padding: EdgeInsets.fromLTRB(40, 15, 40, 7),
                    child:Text('رجــوع',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  ),
                  onPressed:() {
                    Navigator.pop(context,  MaterialPageRoute(builder: (context)=>menuPage()));
                  }

              ),
              SizedBox(height: 20.0,),
            ],
          ),

        ]
      ),
      ),


    );
  }

  // Future <void> fetchCustomers() async {
  //
  //   final response =
  //   await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
  //   if (response.statusCode == 200) {
  //     var resBody=json.decode(response.body)['data'];
  //     setState(() {
  //       data =resBody ;
  //     });
  //
  //   }else {
  //     throw Exception('Failed to load data.');}
  // }

  Future <void> fetchCustomers() async {
    var token  = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNWUzM2I2Y2Q0MTVjNTFlMzA0OWRlNWY0ODlmNDRiMzhiODE3Y2MwZWJiNGVkMDllMzAxZDNkZTE0NDM0NWQ1YTdiNjVlMmJlYTJkZjMwZTQiLCJpYXQiOjE2NTI3ODMzNTcuNzE5NTIsIm5iZiI6MTY1Mjc4MzM1Ny43MTk1MjQsImV4cCI6MTY4NDMxOTM1Ny41NDMyMzcsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.gzUTjg4SJcTSLVvc5kFMmAl7dxuBUkCnmKrfYjdeiW2aGdAjEs52H6t_ehFQsSZwfb3TlIF3mXRiu06d3jW4X1Qcj2W6q5uJy93YS2f8hIp3pVOPbVb_bwc2MiryEvvRWmyFWmDP4RG0p4HDyQtB1anFEuWc58VFgKRA_4zERoFR24Rnrchw7-ToWI3xZfa1dcLUx4cmYEWW3tsKrbi_4LQmzCAL-DcyxjUqZmZcBZ1UAPz5nBUdKPfoQpNAs6XBu2Vj1yHcZ_up8dHuLtrzw0cYgKZSOP-UtCqmrd8ubCrj_-PFmms1P8MGk63e5RGkpoNGaSGT_RgrMB2OKFOnuMDp7rnf59u7CTR2hdA5JFvrN4h5MEAosIenomThr51fDd0LweWz-cSSJjKFFTsdImPSC8n6K50GxLTojemfDuNytmZ4wazs4m8dEUlbD9QCa7eGQGFQ19MJrticiJl5akuo0Uci_C-AMTdntw5logwpp09Dg3ZzOg7ljU4-T34CGc806IUeTRgTyC6uOpvyIkHqlUuWulxkVD5-IzZ_qhRctNci4i0dkVQPZ3Vr9G0qViXaXTIwDoBq0jsIKggB_rfHsllQaDQorUeusgq1CH6ry_1zGsfb2TeIlaLilL72Vrzkc6mhjU2Q2wQMOATHGc9aRRZsl7_0qOxd9sGeIVg";

    final response =
    await http.get(Uri.parse("http://192.168.178.155:8000/api/costomers"), headers: <String,String>{
      'Authorization' : token,
    });

    if (response.statusCode == 200) {
      print(response.headers);
      var resBody=  json.decode(response.body)['data'];

      print(resBody);
      setState(() {

        data =resBody ;
      });


    }else {
      throw Exception('Failed to load data.');}

  }


}

class Customers {
  // final id, email, first_name, last_name, avatar;
 final id, name, phone, type;

  Customers({this.id, this.name, this.phone, this.type});
  factory  Customers.fromJson(Map<String, dynamic> json){
    return Customers(
        id: json['id'],
        name:json['name'],
        phone:json['phone'],
        type:json['type'],
    );
  }
  // Customers({this.id, this.email, this.first_name, this.last_name, this.avatar});
  // factory Customers.fromJson(Map<String, dynamic> json) {
  //   return Customers(
  //       id: json['id'],
  //       email: json['email'],
  //     first_name:json['first_name'],
  //     last_name:json['last_name'],
  //     avatar:json['avatar'],
  //
  //   );
  //
  // }
  //  Map<String, dynamic> tojson()=>{
  //    "id": id,
  //    "email" : email,
  //    "first_name" : first_name,
  //    "last_name" : last_name,
  //    "avatar":avatar,
  //
  //  };
 //  int get userid=>id;
}


