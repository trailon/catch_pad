class ActivityModel {
  String? activity;
  String? type;
  int? participants;
  num? price;
  String? link;
  String? key;
  num? accessibility;

  ActivityModel(
      {this.activity,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key,
      this.accessibility});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'];
    link = json['link'];
    key = json['key'];
    accessibility = json['accessibility'];
  }
}
