// To parse this JSON data, do
//
//     final albumModel = albumModelFromJson(jsonString);

import 'dart:convert';

AlbumModel albumModelFromJson(String str) =>
    AlbumModel.fromJson(json.decode(str));

String albumModelToJson(AlbumModel data) => json.encode(data.toJson());

class AlbumModel {
  String? albumType;
  List<Artist>? artists;
  List<String>? availableMarkets;
  List<Copyright>? copyrights;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;
  List<dynamic>? genres;
  String? href;
  String? id;
  List<Image>? images;
  String? label;
  String? name;
  int? popularity;
  // DateTime? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  Tracks? tracks;
  String? type;
  String? uri;

  AlbumModel({
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.copyrights,
    this.externalIds,
    this.externalUrls,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.label,
    this.name,
    this.popularity,
    // this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.tracks,
    this.type,
    this.uri,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        albumType: json["album_type"],
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
        copyrights: json["copyrights"] == null
            ? []
            : List<Copyright>.from(
                json["copyrights"]!.map((x) => Copyright.fromJson(x))),
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        genres: json["genres"] == null
            ? []
            : List<dynamic>.from(json["genres"]!.map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        label: json["label"],
        name: json["name"],
        popularity: json["popularity"],
        // releaseDate: json["release_date"] == null
        //     ? null
        //     : DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "copyrights": copyrights == null
            ? []
            : List<dynamic>.from(copyrights!.map((x) => x.toJson())),
        "external_ids": externalIds?.toJson(),
        "external_urls": externalUrls?.toJson(),
        "genres":
            genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "label": label,
        "name": name,
        "popularity": popularity,
        // "release_date":
        //     "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "tracks": tracks?.toJson(),
        "type": type,
        "uri": uri,
      };
}

class Artist {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
      };
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({
    this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

class Copyright {
  String? text;
  String? type;

  Copyright({
    this.text,
    this.type,
  });

  factory Copyright.fromJson(Map<String, dynamic> json) => Copyright(
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
      };
}

class ExternalIds {
  String? upc;

  ExternalIds({
    this.upc,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        upc: json["upc"],
      );

  Map<String, dynamic> toJson() => {
        "upc": upc,
      };
}

class Image {
  int? height;
  String? url;
  int? width;

  Image({
    this.height,
    this.url,
    this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}

class Tracks {
  String? href;
  List<Item>? items;
  int? limit;
  dynamic next;
  int? offset;
  dynamic previous;
  int? total;

  Tracks({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
      };
}

class Item {
  List<Artist>? artists;
  List<String>? availableMarkets;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  String? name;
  String? previewUrl;
  int? trackNumber;
  String? type;
  String? uri;

  Item({
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.name,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        name: json["name"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "name": name,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
      };
}
