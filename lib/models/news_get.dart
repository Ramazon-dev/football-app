class GetNews {
  int? id;
  String? title;
  String? discription;
  String? photo;
  String? inserted;
  String? updated;

  GetNews(
      {this.id,
      this.title,
      this.discription,
      this.photo,
      this.inserted,
      this.updated});

  GetNews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    discription = json['discription'];
    photo = json['photo'];
    inserted = json['inserted'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['discription'] = this.discription;
    data['photo'] = this.photo;
    data['inserted'] = this.inserted;
    data['updated'] = this.updated;
    return data;
  }
}
