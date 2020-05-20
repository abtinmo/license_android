import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';

class LicenseDetail extends StatefulWidget {
  static const routeName = "/license-detail";

  @override
  _LicenseDetailState createState() => _LicenseDetailState();
}

class _LicenseDetailState extends State<LicenseDetail> {
  String licenseText;
  bool dataLoaded = false;

  final dio = Dio();
  void _getDetail(licenseName) async {
    final response =
        await dio.get("http://license.newbtin.ir/license/" + licenseName);
    if (this.dataLoaded == false) {
      setState(
        () {
          licenseText = response.data;
          this.dataLoaded = true;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String licenseName = ModalRoute.of(context).settings.arguments;
    this._getDetail(licenseName);
    if (!this.dataLoaded) {
      return Scaffold(
        appBar: AppBar(
          title: Text(licenseName),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(licenseName),
      ),
      body: SingleChildScrollView(
        child: Html(
          data: licenseText,
        ),
      ),
    );
  }
}
