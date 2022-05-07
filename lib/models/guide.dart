class Guide {
  late String? url;
  late String? startDate;
  late String? endDate;
  late String? name;
  late String? icon;
  late String? objType;
  late bool? loginRequired;

  Guide({
    this.url,
    this.startDate,
    this.endDate,
    this.name,
    this.icon,
    this.objType,
    this.loginRequired
  });

  factory Guide.fromJson(dynamic json) {
    return Guide(
      url: json["url"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      name: json["name"],
      icon: json["icon"],
      objType: json["objType"],
      loginRequired: json["loginRequired"],
    );
  }
}