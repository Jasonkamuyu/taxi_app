import 'package:flutter/material.dart';

import '../helpers/style.dart';
import '../widgets/loading.dart';




class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/lg.png", width: 200,),
          Loading(),
        ],
      )
    );
  }
}
