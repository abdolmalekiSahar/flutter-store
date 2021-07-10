import 'package:flutter/material.dart';
import 'package:store/service_locator/service_locator.dart';
import 'LoginPage.dart';

void main() {
  setupServiceLocator();
  runApp(MainMaterial());
}

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
