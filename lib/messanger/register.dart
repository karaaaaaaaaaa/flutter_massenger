import 'package:flutter/material.dart';
import 'package:messanger/constants.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _MyAppState();
}

class _MyAppState extends State<register> {
  // const MyApp({super.key});
  var formkey = GlobalKey<FormState>();

  bool _isPassword = true;

  var Emailcontroll = TextEditingController();
  var phonecontroll = TextEditingController();
  var namecontroll = TextEditingController();

  var passcontroll = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("register "),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "REGISTER ",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                  // TextFormField(
                  //   key: formkey,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "please enter your emails";
                  //     }
                  //     return null;
                  //   },
                  //   keyboardType: TextInputType.emailAddress,
                  //   controller: Emailcontroll,
                  //   decoration: InputDecoration(
                  //       label: Text("Email"),
                  //       prefixIcon: Icon(Icons.email),
                  //       border: OutlineInputBorder()),
                  // )
                  SizedBox(
                    height: 20,
                  ),
                    defuilttextform(
                      lable: "Name",
                      controller: namecontroll,
                      validat: (value) {
                        if (value!.isEmpty) {
                          return "please enter your name";
                        }
                        return null;
                      },
                      prefixicon: Icons.person,
                      Border: OutlineInputBorder()),
                  SizedBox(
                    height: 20,
                  ),

                  defuilttextform(
                      lable: "Email",
                      controller: Emailcontroll,
                      validat: (value) {
                        if (value!.isEmpty) {
                          return "please enter your emails";
                        }
                        return null;
                      },
                      prefixicon: Icons.email,
                      Border: OutlineInputBorder()),
                  SizedBox(
                    height: 20,
                  ),
                  defuilttextform(
                      lable: "Password",
                      
                      controller: passcontroll,
                      validat: (value) {
                        if (value!.isEmpty) {
                          return "please enter your password";
                        }
                        return null;
                      },
                      prefixicon: Icons.lock,
                      ispassword: _isPassword,
                      suffixicon:
                          _isPassword ? Icons.visibility_off : Icons.visibility,
                      suffixclick: () {
                        setState(() {
                          _isPassword = !_isPassword;
                        });
                      },
                      Border: OutlineInputBorder()),
                  SizedBox(
                    height: 20,
                  ), 
                    defuilttextform(
                      lable: "phone",
                      controller: phonecontroll,
                      validat: (value) {
                        if (value!.isEmpty) {
                          return "please enter your phone";
                        }
                        return null;
                      },
                      prefixicon: Icons.phone,
                      Border: OutlineInputBorder()),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            print("DoNEEEEEEEEEEEEEEEEEEE");
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 20),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
