class GamesScores {
  String? status;
  int? count;
  List<Data>? data;
  int? offset;
  String? traceId;

  GamesScores({this.status, this.count, this.data, this.offset, this.traceId});

  GamesScores.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] is List) {
      data = (json['data'] as List).map((v) => Data.fromJson(v)).toList();
    } else {
      print('❗json["data"] is not a list');
    }
    offset = json['offset'];
    traceId = json['traceId'];
  }

  void operator [](int other) {}
}

class Data {
  int? id;
  String? flashId;
  String? date;
  int? dateUtc;
  int? status;
  List<String>? periods;
  String? statusName;
  int? elapsed;
  int? extraMinutes;
  int? homeResult;
  int? awayResult;
  int? homeHTResult;
  int? awayHTResult;
  int? homeFTResult;
  int? awayFTResult;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;
  Season? season;
  String? roundName;
  List<MarketOdds>? odds;

  Data({
    this.id,
    this.flashId,
    this.date,
    this.dateUtc,
    this.status,
    this.periods,
    this.statusName,
    this.elapsed,
    this.extraMinutes,
    this.homeResult,
    this.awayResult,
    this.homeHTResult,
    this.awayHTResult,
    this.homeFTResult,
    this.awayFTResult,
    this.homeTeam,
    this.awayTeam,
    this.season,
    this.roundName,
    this.odds,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flashId = json['flashId'];
    date = json['date'];
    dateUtc = json['dateUtc'];
    status = json['status'];
    if (json['periods'] != null && json['periods'] is List) {
      periods = (json['periods'] as List)
          .map((item) => item.toString())
          .toList();
    } else {
      print('❗ json["periods"] is not a valid list: ${json['periods']}');
    }
    statusName = json['statusName'];
    elapsed = json['elapsed'];
    extraMinutes = json['extraMinutes'];
    homeResult = json['homeResult'];
    awayResult = json['awayResult'];
    homeHTResult = json['homeHTResult'];
    awayHTResult = json['awayHTResult'];
    homeFTResult = json['homeFTResult'];
    awayFTResult = json['awayFTResult'];

    homeTeam = json['homeTeam'] != null
        ? HomeTeam.fromJson(json['homeTeam'])
        : null;
    awayTeam = json['awayTeam'] != null
        ? HomeTeam.fromJson(json['awayTeam'])
        : null;
    season = json['season'] != null ? Season.fromJson(json['season']) : null;
    roundName = json['roundName'];

    if (json['odds'] is List) {
      odds = (json['odds'] as List).map((v) => MarketOdds.fromJson(v)).toList();
    } else {
      print('❗ json["odds"] is not a list: ${json['odds']}');
    }
  }
}

class HomeTeam {
  int? id;
  String? name;
  String? flashId;
  Country? country;

  HomeTeam({this.id, this.name, this.flashId, this.country});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    flashId = json['flashId'];
    country = json['country'] != null
        ? Country.fromJson(json['country'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['flashId'] = this.flashId;
    if (this.country != null) data['country'] = this.country!.toJson();
    return data;
  }
}

class Country {
  String? code;
  String? name;

  Country({this.code, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}

class Season {
  String? uid;
  int? year;
  League? league;

  Season({this.uid, this.year, this.league});

  Season.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    year = json['year'];
    league = json['league'] != null ? League.fromJson(json['league']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = this.uid;
    data['year'] = this.year;
    if (this.league != null) data['league'] = this.league!.toJson();
    return data;
  }
}

class League {
  int? id;
  String? name;
  Country? country;
  String? flashScoreId;

  League({this.id, this.name, this.country, this.flashScoreId});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'] != null
        ? Country.fromJson(json['country'])
        : null;
    flashScoreId = json['flashScoreId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.country != null) data['country'] = this.country!.toJson();
    data['flashScoreId'] = this.flashScoreId;
    return data;
  }
}

class MarketOdds {
  int? marketId;
  dynamic marketName;
  List<Odds>? odds;

  MarketOdds({this.marketId, this.marketName, this.odds});

  MarketOdds.fromJson(Map<String, dynamic> json) {
    marketId = json['marketId'];
    marketName = json['marketName'];
    if (json['odds'] is List) {
      odds = (json['odds'] as List).map((v) => Odds.fromJson(v)).toList();
    } else {
      print('❗ json["odds"] inside MarketOdds is not a list: ${json['odds']}');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['marketId'] = this.marketId;
    data['marketName'] = this.marketName;
    if (this.odds != null) {
      data['odds'] = this.odds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Odds {
  String? name;
  double? value;
  dynamic openingValue;

  Odds({this.name, this.value, this.openingValue});

  Odds.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = (json['value'] as num).toDouble();
    openingValue = json['openingValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = this.name;
    data['value'] = this.value;
    data['openingValue'] = this.openingValue;
    return data;
  }
}
