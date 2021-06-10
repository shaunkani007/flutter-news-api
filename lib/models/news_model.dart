// @dart=2.9
// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    NewsModel({
        this.status,
        this.statusCode,
        this.version,
        this.lastModified,
        this.access,
        this.total,
        this.limit,
        this.offset,
        this.data,
    });

    String status;
    int statusCode;
    String version;
    String lastModified;
    String access;
    int total;
    int limit;
    int offset;
    List<Datum> data;

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        statusCode: json["status-code"],
        version: json["version"],
        lastModified: json["last-modified"],
        access: json["access"],
        total: json["total"],
        limit: json["limit"],
        offset: json["offset"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "status-code": statusCode,
        "version": version,
        "last-modified": lastModified,
        "access": access,
        "total": total,
        "limit": limit,
        "offset": offset,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.title,
        this.summary,
        this.link,
        this.published,
        this.image,
    });

    int id;
    String title;
    String summary;
    String link;
    String published;
    String image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        summary: json["summary"] == null ? 'Hello' : json["summary"],
        link: json["link"],
        published: json["published"],
        image: json["image"] == null ? null : json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "summary": summary == null ? null : summary,
        "link": link,
        "published": published,
        "image": image == null ? null : image,
    };
}
