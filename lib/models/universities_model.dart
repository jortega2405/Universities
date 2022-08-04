

 
class Universities {
  late String alphaTwoCode;
  late List<String> domains;
  late String country;
  late List<String> webPages;
  late String name;

  Universities(
      {required this.alphaTwoCode,
      required this.domains,
      required this.country,
      required this.webPages,
     required this.name});

  Universities.fromJson(Map<String, dynamic> json) {
    alphaTwoCode = json['alpha_two_code'];
    domains = json['domains'].cast<String>();
    country = json['country'];
    webPages = json['web_pages'].cast<String>();
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alpha_two_code'] = this.alphaTwoCode;
    data['domains'] = this.domains;
    data['country'] = this.country;
    data['web_pages'] = this.webPages;
    data['name'] = this.name;
    return data;
  }
}
