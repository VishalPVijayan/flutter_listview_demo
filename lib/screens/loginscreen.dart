import 'package:flutter/material.dart';
import 'package:flutterdemo/utilities/colors.dart';
import 'package:flutterdemo/utilities/string_constants.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  style: TextStyle(fontSize: 20),

                )),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: StringConstants.username,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: StringConstants.password,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(StringConstants.forgot,),
            ),
            Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  child: const Text(StringConstants.submit),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )
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