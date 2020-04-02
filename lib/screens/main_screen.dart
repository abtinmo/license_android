import 'package:flutter/material.dart';
import './about_screen.dart';
import './license_detail_screen.dart';
import 'package:dio/dio.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String nextPage = "https://license.newbtin.ir/license";

  ScrollController _scrollController = ScrollController();

  bool isLoading = false;

  List names = List();

  final dio = Dio();
  void _getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      final response = await dio.get(nextPage);
      List tempList = List();
      nextPage = response.data["data"]['next'];
      for (int i = 0; i < response.data["data"]['results'].length; i++) {
        tempList.add(response.data["data"]['results'][i]);
      }

      setState(() {
        isLoading = false;
        names.addAll(tempList);
      });
    }
  }

  @override
  void initState() {
    this._getMoreData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      //+1 for progressbar
      itemCount: names.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == names.length) {
          return _buildProgressIndicator();
        } else {
          return ListTile(
            title: Text(names[index]),
            trailing: IconButton(
                icon: Icon(Icons.more),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    LicenseDetail.routeName,
                    arguments: names[index],
                  );
                }),
          );
        }
      },
      controller: _scrollController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("license"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AboutScreen.routeName);
            },
          ),
        ],
      ),
      body: Container(
        child: _buildList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("do search");
        },
        tooltip: 'Increment',
        child: Icon(Icons.search),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
