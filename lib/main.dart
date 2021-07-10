import 'package:flutter/material.dart';
import 'LoginPage.dart';


void main() => runApp(MainMaterial());

class MainMaterial extends StatelessWidget {
  const MainMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

