class GetMatchesResponce {
  int? id;
  String? firstTimeName;
  String? firstTimePhoto;
  String? secondTimeName;
  String? secondTimePhoto;
  String? textDescription;
  String? matchTime;
  String? matchDate;
  String? inserted;
  String? updated;

  GetMatchesResponce(
      {this.id,
      this.firstTimeName,
      this.firstTimePhoto,
      this.secondTimeName,
      this.secondTimePhoto,
      this.textDescription,
      this.matchTime,
      this.matchDate,
      this.inserted,
      this.updated});

  GetMatchesResponce.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstTimeName = json['firstTimeName'];
    firstTimePhoto = json['firstTimePhoto'];
    secondTimeName = json['secondTimeName'];
    secondTimePhoto = json['secondTimePhoto'];
    textDescription = json['textDescription'];
    matchTime = json['matchTime'];
    matchDate = json['matchDate'];
    inserted = json['inserted'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstTimeName'] = this.firstTimeName;
    data['firstTimePhoto'] = this.firstTimePhoto;
    data['secondTimeName'] = this.secondTimeName;
    data['secondTimePhoto'] = this.secondTimePhoto;
    data['textDescription'] = this.textDescription;
    data['matchTime'] = this.matchTime;
    data['matchDate'] = this.matchDate;
    data['inserted'] = this.inserted;
    data['updated'] = this.updated;
    return data;
  }
}
