import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/helpers/style.dart';
import 'package:taxi_app/screens/home.dart';
import 'package:taxi_app/screens/registration.dart';

import '../helpers/screen_navigation.dart';
import '../providers/user.dart';
import '../widgets/custom_text.dart';
import '../widgets/loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: Colors.deepOrange,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: white,
                    height: 100,
                  ),
                  Container(
                    color: white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "images/lg.png",
                          width: 230,
                          height: 230,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    color: white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: authProvider.email,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: white),
                              border: InputBorder.none,
                              hintText: "Email",
                              icon: Icon(
                                Icons.email,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: authProvider.password,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: white),
                              border: InputBorder.none,
                              hintText: "Password",
                              icon: Icon(
                                Icons.lock,
                                color: white,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () async {
                        if (!await authProvider.signIn()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Login failed!")));
                          return;
                        }
                        authProvider.clearController();
                        changeScreenReplacement(context, MyHomePage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomText(
                                text: "Login",
                                color: white,
                                size: 22,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeScreen(context, RegistrationScreen());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(
                          text: "Register here",
                          size: 20,
                          color: null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
