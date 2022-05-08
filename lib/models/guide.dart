class Guide {
  late String? url;
  late String? startDate;
  late String? endDate;
  late String? name;
  late String? icon;

  Guide({
    this.url,
    this.startDate,
    this.endDate,
    this.name,
    this.icon,
  });

  factory Guide.fromJson(dynamic json) {
    return Guide(
      url: json["url"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      name: json["name"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'startDate': startDate,
      'endDate': endDate,
      'name': name,
      'icon': icon,
    };
  }
}