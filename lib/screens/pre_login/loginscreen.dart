import 'package:flutter/material.dart';
import 'package:flutterdemo/utilities/colors.dart';
import 'package:flutterdemo/utilities/string_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.app_name,
      home: Scaffold(
        appBar: AppBar(title: const Text(StringConstants.app_name),backgroundColor: AppColors.blackColor),
        body: const LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  'Images/hutechlogo.png',
                  height: 50,
                  width: 50,
                ), ),

            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Login in',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, color: AppColors.blackColor),

                )),
            Container(
              padding: const EdgeInsets.all(8),
              child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.redAccent,
                  primaryColorDark: Colors.red,
                ),
                child: new TextField(
                  controller: nameController,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: 'Registered Email',
                      labelText: 'Email',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.indigo,
                      ),
                      prefixText: ' ',
                      suffixText: '',
                      suffixStyle: const TextStyle(color: Colors.green)),
              ),)
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.redAccent,
                  primaryColorDark: Colors.red,
                ),
                child: new TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: const Icon(
                        Icons.key,
                        color: Colors.indigo,
                      ),
                      prefixText: ' ',
                      suffixText: '',
                      suffixStyle: const TextStyle(color: Colors.green)),
              ),)
            ),

            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(StringConstants.forgot,),
            ),

            ElevatedButton(
              child: Text(StringConstants.submit),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {
                if(nameController.text.isNotEmpty && passwordController.text.isNotEmpty){

                  print(nameController.text);
                  print(passwordController.text);

                  Fluttertoast.showToast(
                      msg: "Navigate",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                }
                else{

                  Fluttertoast.showToast(
                      msg: "Please provide valid credentials.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                }


              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () {

                  },
                )
              ],
            ),
          ],
        ));
  }
}