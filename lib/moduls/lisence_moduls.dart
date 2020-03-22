class License {
  final int count;
  final bool next;
  final bool previous;
  final List<String> results;

  License({this.count, this.next, this.previous, this.results});

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'],
    );
  }
}

class LicenseDetail {
  final String licenseText;
  final String name;
  final bool isOsiApproved;

  LicenseDetail({this.licenseText, this.name, this.isOsiApproved});

  factory LicenseDetail.fromJson(Map<String, dynamic> json) {
    return LicenseDetail(
      name: json['name'],
      isOsiApproved: json['isOsiApproved'],
      licenseText: json['licenseText'],
    );
  }
}
