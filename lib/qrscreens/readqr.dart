import 'dart:convert';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_scanner2/screens/main_menu.dart';
import 'package:http/http.dart'as http;
import '../screens/widget/choose_products.dart';
import '../theme_helper/themes.dart';

class ScanScreen extends StatefulWidget {


  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var productQuantityController= TextEditingController();
  List data =[];
  var qrstr = 'المنتج ';
  String product = 'اختر منتج ';

  var height, width;

  var items = [
    'سائل جلي نورا',
    'دوا غسيل',
  ];
  int value1 =2;
  List<Products> _products = [];
  @override
  void initState() {
  //  fetchProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;

    _products = (data).map<Products>((item) => Products.fromJson(item)).toList();
    String _chosenValue='choose customer';
    int value3=value1;
    int value2=value1;
    if(productQuantityController.text.isNotEmpty){
     value3=int.parse(productQuantityController.text);
      value2=value2*value3; }


    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
          const SizedBox(height: 50, width: 100,),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
            elevation: MaterialStateProperty.all(4),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),

              ),
            ),
          ),

          onPressed: () => scanQr(), child:
        const Text(
          'Scan', style:  TextStyle(color: Colors.black, fontSize: 30),),
        ),
        Text(qrstr, style: const TextStyle(color: Colors.blue, fontSize: 30),),

        const SizedBox(height: 40, width: 100,),
        const Text('اختيـار منتج', style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
        DropdownButton(
          focusColor: Colors.white38,
          elevation: 4,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
          iconEnabledColor: Colors.black,
          items: _products.map((Products items) {
            return DropdownMenuItem(
              value: items.ProductName.toString(),
              child: Text(items.ProductName),
            );
          }).toList(),
          hint: Text('اختر منتج'),
          onChanged: (String? value) {
            setState(() {
              product = value!;
             final index=_products.indexWhere((element) => element.ProductName==_chosenValue);
             value1=_products[index].getproductPrice;
            });
          },
        ),
        const SizedBox(height: 30.0,),
        TextField(
            controller:productQuantityController,
            keyboardType: TextInputType.number,
          decoration: ThemeHelper().textInputDecoration(
              'الكمية', 'أدخل الكمية'),
        ),
        const SizedBox(height: 40.0,),
        Text('$value1'+' :  السعر الإفرادي', style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,),),
        const Divider(color: Colors.black,),
        const SizedBox(height: 7.0,),
        Text(('$value2')+ ': السعر الإجمالي', style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
        const Divider(color: Colors.black,),
            const SizedBox(height: 20, width: 100,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white54),
                  elevation: MaterialStateProperty.all(4),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),

                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text('متابعة'.toUpperCase(), style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),),
                ),
                onPressed: () {
                  Navigator.push(context,  MaterialPageRoute(builder: (context)=>chooseproducts(name:product ,)));
                }
            ),
            //  SizedBox(width: 7.0,),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white54),
                  elevation: MaterialStateProperty.all(4),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),

                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text('رجوع'.toUpperCase(), style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),),
                ),
                onPressed: () {
                  Navigator.push(context,  MaterialPageRoute(builder: (context)=>menuPage()));
                }
            ),
            ]
        ),
          ],

        ),
      ),
    );

  }

  Future<void> scanQr() async {
    String barcodeqr;
    try {
      barcodeqr = await FlutterBarcodeScanner.scanBarcode(
          '#2A99CF', 'cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeqr = 'failed to scan';
    }
    if (!mounted) return;
    setState(() {
      qrstr = barcodeqr;
      final index=_products.indexWhere((element) => element.productid==qrstr);
      value1=_products[index].getproductPrice;
      product=_products[index].getProductName;
    });
  }


  Future <void> fetchProducts() async {
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

class Products{
  final productid,ProductName,categoryid,PurchasingPrice,WholeSalePrice,RetailSalePrice,Quantity,DateOfSupply,expireDate,description;

  Products({
     this.productid,
      this.ProductName,
      this.categoryid,
      this.PurchasingPrice,
      this.WholeSalePrice,
      this.RetailSalePrice,
      this.Quantity,
      this.DateOfSupply,
      this.expireDate,
      this.description});
  factory  Products.fromJson(Map<String, dynamic> json){
    return Products(
      productid:json['product_id'],
      ProductName: json['product_name'],
      categoryid:json['category_id'],
      PurchasingPrice:json['Purchasing_price'],
      WholeSalePrice:json['Wholesale_price'],
      RetailSalePrice:json['retail_price'],
      Quantity:json['Quantity'],
      DateOfSupply:json['date_of_supply'],
      expireDate:json['Expiry_date'],
      description:json['description'],
    );

  }
  Map<String, dynamic> tojson()=>{
    'retail_price':RetailSalePrice,
    'category_id':categoryid,
    'Wholesale_price':WholeSalePrice,
    'product_name':ProductName,
  };
  int get getproductid=>productid;
  int get getproductPrice=>RetailSalePrice;
  int get getproductcatid=>categoryid;
  int get getWholesalePrice=>WholeSalePrice;
  String get getProductName=>ProductName;
  // Map<String, Products> findById(String productId) {
  //   return items.map((key, value) => value.id == productId).toList(); //this is where the error is
  // }

}
