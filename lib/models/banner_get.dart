class BannerGet {
  int? id;
  String? link;
  String? photo;
  String? inserted;
  String? updated;

  BannerGet({this.id, this.link, this.photo, this.inserted, this.updated});

  BannerGet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    photo = json['photo'];
    inserted = json['inserted'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['photo'] = this.photo;
    data['inserted'] = this.inserted;
    data['updated'] = this.updated;
    return data;
  }
}
