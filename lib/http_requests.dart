// import 'dart:async';
// import 'dart:convert';
// import './moduls/lisence_moduls.dart';

// Future<License> fetchLicenseList() async {
//   final response = await http.get('https://api.newbtin.ir/license/');

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return License.fromJson(json.decode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load Licences');
//   }
// }

// Future<LicenseDetail> fetchLicense(licenseId) async {
//   final response = await http.get('https://api.newbtin.ir/license/$licenseId');

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return LicenseDetail.fromJson(json.decode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load Licences');
//   }
// }
