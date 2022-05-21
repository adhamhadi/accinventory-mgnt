import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_scanner2/screens/widget/header_widget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../theme_helper/themes.dart';
import 'main_menu.dart';

class LoginPage extends StatefulWidget{

  @override
  _LoginPageState createState() => _LoginPageState();
  }

class _LoginPageState extends State<LoginPage> {
  bool _isloading=false;
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  double _headerHeight =200;
  Key _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      body:_isloading? Center(child: CircularProgressIndicator(),):
     SingleChildScrollView(child:
      Column(
        children:[
          Container(
            height: _headerHeight,
            child: HeaderWidget(_headerHeight,true,Icons.login_rounded),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),

              child: Column(
                children: [
                  const Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30.0,),
                  Form(
                    key: _formKey,

                      child:Column(
                        children: [
                          TextField(
                            controller:emailController,
                            decoration: ThemeHelper().textInputDecoration( 'User Name', 'Enter your user name'),
                          ),
                          const SizedBox(height: 30.0,),
                          TextField(
                            obscureText: true,
                            controller:passwordController,
                            decoration: ThemeHelper().textInputDecoration( 'Password', 'Enter your Password'),
                          ),
                          const SizedBox(height:30.0,),
                          Container(
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                               style: ThemeHelper().buttonStyle(),
                               child:Padding(
                                 padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child:Text('Sign in'.toUpperCase(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                          ),
                              onPressed:() {
                                Navigator.push(context,  MaterialPageRoute(builder: (context)=>menuPage()));
                                //  setState(() {
                                //     _isloading=true;
                                //  });
                                // login();
                              },
                            )
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
     ),
    );
  }
  Future<void> login() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    if(passwordController.text.isNotEmpty && emailController.text.isNotEmpty){
     var response= await http.post(Uri.parse("https://reqres.in/api/login"),body:{
       // 'email':emailController.text.toString(),
       // 'password':passwordController.text.toString()});
        'email': "A@gmail.com",
       'password' : "123456789"});

     if(response.statusCode==200){

       var token =json.decode(response.body)['data']['token'];
    //   var token =json.decode(response.body)['token'];
       setState(() {
         _isloading=false;
         sharedPreferences.setString('token', token);
         Navigator.push(context,  MaterialPageRoute(builder: (context)=>menuPage()));
       });
       print(token.toString());

     }else{
       _isloading=false;
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text("invalid Credentials."),));
     }
    } else{
      _isloading=false;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Black field not allowed"),));
    }

  }
}
