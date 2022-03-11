class GetMatches {
  int? id;
  String? firstTimeName;
  String? firstTimePhoto;
  String? secondTimeName;
  String? secondTimePhoto;
  String? textDescription;
  MatchTime? matchTime;
  String? matchDate;
  String? inserted;
  String? updated;

  GetMatches(
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

  GetMatches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstTimeName = json['firstTimeName'];
    firstTimePhoto = json['firstTimePhoto'];
    secondTimeName = json['secondTimeName'];
    secondTimePhoto = json['secondTimePhoto'];
    textDescription = json['textDescription'];
    matchTime = json['matchTime'] != null
        ? new MatchTime.fromJson(json['matchTime'])
        : null;
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
    if (this.matchTime != null) {
      data['matchTime'] = this.matchTime!.toJson();
    }
    data['matchDate'] = this.matchDate;
    data['inserted'] = this.inserted;
    data['updated'] = this.updated;
    return data;
  }
}

class MatchTime {
  int? ticks;
  int? days;
  int? hours;
  int? milliseconds;
  int? minutes;
  int? seconds;
  int? totalDays;
  int? totalHours;
  int? totalMilliseconds;
  int? totalMinutes;
  int? totalSeconds;

  MatchTime(
      {this.ticks,
      this.days,
      this.hours,
      this.milliseconds,
      this.minutes,
      this.seconds,
      this.totalDays,
      this.totalHours,
      this.totalMilliseconds,
      this.totalMinutes,
      this.totalSeconds});

  MatchTime.fromJson(Map<String, dynamic> json) {
    ticks = json['ticks'];
    days = json['days'];
    hours = json['hours'];
    milliseconds = json['milliseconds'];
    minutes = json['minutes'];
    seconds = json['seconds'];
    totalDays = json['totalDays'];
    totalHours = json['totalHours'];
    totalMilliseconds = json['totalMilliseconds'];
    totalMinutes = json['totalMinutes'];
    totalSeconds = json['totalSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticks'] = this.ticks;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['milliseconds'] = this.milliseconds;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    data['totalDays'] = this.totalDays;
    data['totalHours'] = this.totalHours;
    data['totalMilliseconds'] = this.totalMilliseconds;
    data['totalMinutes'] = this.totalMinutes;
    data['totalSeconds'] = this.totalSeconds;
    return data;
  }
}
