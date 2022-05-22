// To parse this JSON data, do
//
//     final flickrData = flickrDataFromJson(jsonString);

import 'dart:convert';

FlickrData flickrDataFromJson(dynamic str) => FlickrData.fromJson(str);

String flickrDataToJson(FlickrData data) => json.encode(data.toJson());

class FlickrData {
  FlickrData({
    required this.photos,
    required this.extra,
    required this.stat,
  });

  Photos photos;
  Extra extra;
  String stat;

  factory FlickrData.fromJson(Map<String, dynamic> json) => FlickrData(
        photos: Photos.fromJson(json["photos"]),
        extra: Extra.fromJson(json["extra"]),
        stat: json["stat"],
      );

  Map<String, dynamic> toJson() => {
        "photos": photos == null ? null : photos.toJson(),
        "extra": extra == null ? null : extra.toJson(),
        "stat": stat == null ? null : stat,
      };
}

class Extra {
  Extra({
    required this.exploreDate,
    required this.nextPreludeInterval,
  });

  DateTime exploreDate;
  int nextPreludeInterval;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        exploreDate: DateTime.parse(json["explore_date"]),
        nextPreludeInterval: json["next_prelude_interval"],
      );

  Map<String, dynamic> toJson() => {
        "explore_date": exploreDate == null
            ? null
            : "${exploreDate.year.toString().padLeft(4, '0')}-${exploreDate.month.toString().padLeft(2, '0')}-${exploreDate.day.toString().padLeft(2, '0')}",
        "next_prelude_interval":
            nextPreludeInterval == null ? null : nextPreludeInterval,
      };
}

class Photos {
  Photos({
    required this.page,
    required this.pages,
    required this.perpage,
    required this.total,
    required this.photo,
  });

  int page;
  int pages;
  int perpage;
  int total;
  List<Photo> photo;

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        page: json["page"] == null ? null : json["page"],
        pages: json["pages"] == null ? null : json["pages"],
        perpage: json["perpage"] == null ? null : json["perpage"],
        total: json["total"] == null ? null : json["total"],
        photo: List<Photo>.from(json["photo"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "pages": pages == null ? null : pages,
        "perpage": perpage == null ? null : perpage,
        "total": total == null ? null : total,
        "photo": photo == null
            ? null
            : List<dynamic>.from(photo.map((x) => x.toJson())),
      };
}

class Photo {
  Photo({
    required this.id,
    required this.owner,
    required this.secret,
    required this.server,
    required this.farm,
    required this.title,
    required this.ispublic,
    required this.isfriend,
    required this.isfamily,
  });

  String id;
  String owner;
  String secret;
  String server;
  int farm;
  String title;
  int ispublic;
  int isfriend;
  int isfamily;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"] == null ? null : json["id"],
        owner: json["owner"] == null ? null : json["owner"],
        secret: json["secret"] == null ? null : json["secret"],
        server: json["server"] == null ? null : json["server"],
        farm: json["farm"] == null ? null : json["farm"],
        title: json["title"] == null ? null : json["title"],
        ispublic: json["ispublic"] == null ? null : json["ispublic"],
        isfriend: json["isfriend"] == null ? null : json["isfriend"],
        isfamily: json["isfamily"] == null ? null : json["isfamily"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "owner": owner == null ? null : owner,
        "secret": secret == null ? null : secret,
        "server": server == null ? null : server,
        "farm": farm == null ? null : farm,
        "title": title == null ? null : title,
        "ispublic": ispublic == null ? null : ispublic,
        "isfriend": isfriend == null ? null : isfriend,
        "isfamily": isfamily == null ? null : isfamily,
      };
}
