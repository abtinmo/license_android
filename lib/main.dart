import 'package:flutter/material.dart';
import './screens/about_screen.dart';
import './screens/license_detail_screen.dart';
import './screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'license',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'FreeSans'
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MainScreen(),
        AboutScreen.routeName: (ctx) => AboutScreen(),
        LicenseDetail.routeName: (ctx) => LicenseDetail(),
      },
    );
  }
}
