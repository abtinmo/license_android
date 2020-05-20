import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '\nThis app uses:', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
            ),
            Text('https://github.com/spdx/license-list-data\n'),
            Text('you can find source code at:', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
            Text('https://gitlab.com/abtinmo/license_android'),
            Text('https://gitlab.com/abtinmo/license_backend'),
          ],
        ),
      ),
    );
  }
}
