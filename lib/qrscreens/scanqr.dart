
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  var qrstr='Add Data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ceating Qr code'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
        BarcodeWidget(data:qrstr ,
            barcode: Barcode.qrCode(),
            color:Colors.blue,
            height: 250,
            width: 250),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width*.8,
            child: TextField(
              onChanged: (value) => {
                setState((){
                  qrstr=value;
                })
              },
              decoration: const InputDecoration(
                hintText: 'Enter your data',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  )
                )
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width,)
        ],
      ),
    );
  }
}
