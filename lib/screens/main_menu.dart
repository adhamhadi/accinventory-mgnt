import 'package:flutter/material.dart';
import 'package:flutter_scanner2/qrscreens/readqr.dart';
import 'package:flutter_scanner2/screens/login_page.dart';
import 'package:flutter_scanner2/screens/widget/add_new_customer.dart';
import 'package:flutter_scanner2/screens/widget/choose_customer.dart';
import 'package:flutter_scanner2/screens/widget/edit_customer_info.dart';
import 'package:flutter_scanner2/screens/widget/header_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class menuPage extends StatefulWidget {
  @override
  _menuPageState createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  late SharedPreferences sharedPreferences;
  final double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    int value = 22500;
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: _headerHeight,
                    child: HeaderWidget(_headerHeight, true, Icons.home),
                  ),
                  Column(children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white70),
                          //shadowColor: MaterialStateProperty.all(Colors.black),
                          elevation: MaterialStateProperty.all(4),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 7),
                          child: Text(
                            'إنشاء فاتورة جديدة'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScanScreen()));
                        }),
                    const SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white70),
                          // shadowColor: MaterialStateProperty.all(Colors.black),
                          elevation: MaterialStateProperty.all(4),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(40, 15, 40, 7),
                          child: Text(
                            'إضافـة  زبـون  جـديـد'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddNewCustomer()));
                        }),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white70,
                          // shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 4,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(40, 15, 40, 7),
                          child: Text(
                            ' تعديل بيانات زبـون'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditCustomerInfo()));
                        }),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white70),
                          //shadowColor: MaterialStateProperty.all(Colors.black),
                          elevation: MaterialStateProperty.all(4),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 7),
                          child: Text(
                            'جـرد  الـمـخــــــزون'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        onPressed: () {}),
                  ]),
                  const SizedBox(
                    height: 75.0,
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.fromLTRB(40, 10, 20, 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          //shadowColor: MaterialStateProperty.all(Colors.black),
                          elevation: MaterialStateProperty.all(8),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).viewInsets.right),
                          child: const Text(
                            'LogOut',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        onPressed: () async {
                          sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.clear();
                          print(sharedPreferences.getString('token'));
                          CircularProgressIndicator();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              ModalRoute.withName("/login"));
                        },
                      )),
                ],
              ),
            )));
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content:  Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7), child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
