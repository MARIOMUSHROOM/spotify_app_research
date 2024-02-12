// To parse this JSON data, do
//
//     final myPlaylistModel = myPlaylistModelFromJson(jsonString);

import 'dart:convert';

MyPlaylistModel myPlaylistModelFromJson(String str) =>
    MyPlaylistModel.fromJson(json.decode(str));

String myPlaylistModelToJson(MyPlaylistModel data) =>
    json.encode(data.toJson());

class MyPlaylistModel {
  String? href;
  List<Item>? items;
  int? limit;
  dynamic next;
  int? offset;
  dynamic previous;
  int? total;

  MyPlaylistModel({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory MyPlaylistModel.fromJson(Map<String, dynamic> json) =>
      MyPlaylistModel(
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
  bool? collaborative;
  String? description;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  Owner? owner;
  dynamic primaryColor;
  bool? public;
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  Item({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: json["name"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        primaryColor: json["primary_color"],
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        "owner": owner?.toJson(),
        "primary_color": primaryColor,
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks?.toJson(),
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

class Owner {
  String? displayName;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;

  Owner({
    this.displayName,
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: json["display_name"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "type": type,
        "uri": uri,
      };
}

class Tracks {
  String? href;
  int? total;

  Tracks({
    this.href,
    this.total,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}
