// To parse this JSON data, do
//
//     final playlistModel = playlistModelFromJson(jsonString);

import 'dart:convert';

PlaylistModel playlistModelFromJson(String str) =>
    PlaylistModel.fromJson(json.decode(str));

String playlistModelToJson(PlaylistModel data) => json.encode(data.toJson());

class PlaylistModel {
  bool? collaborative;
  String? description;
  ExternalUrls? externalUrls;
  Followers? followers;
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

  PlaylistModel({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.followers,
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

  factory PlaylistModel.fromJson(Map<String, dynamic> json) => PlaylistModel(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null
            ? null
            : Followers.fromJson(json["followers"]),
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
        "followers": followers?.toJson(),
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

class Followers {
  dynamic href;
  int? total;

  Followers({
    this.href,
    this.total,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
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
  Type? type;
  String? uri;
  String? name;

  Owner({
    this.displayName,
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
    this.name,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: json["display_name"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        type: typeValues.map[json["type"]]!,
        uri: json["uri"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "type": typeValues.reverse[type],
        "uri": uri,
        "name": name,
      };
}

enum Type { ARTIST, USER }

final typeValues = EnumValues({"artist": Type.ARTIST, "user": Type.USER});

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
  // DateTime? addedAt;
  Owner? addedBy;
  bool? isLocal;
  dynamic primaryColor;
  Track? track;
  VideoThumbnail? videoThumbnail;

  Item({
    // this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        // addedAt:
        //     json["added_at"] == null ? null : DateTime.parse(json["added_at"]),
        addedBy:
            json["added_by"] == null ? null : Owner.fromJson(json["added_by"]),
        isLocal: json["is_local"],
        primaryColor: json["primary_color"],
        track: json["track"] == null ? null : Track.fromJson(json["track"]),
        videoThumbnail: json["video_thumbnail"] == null
            ? null
            : VideoThumbnail.fromJson(json["video_thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        // "added_at": addedAt?.toIso8601String(),
        "added_by": addedBy?.toJson(),
        "is_local": isLocal,
        "primary_color": primaryColor,
        "track": track?.toJson(),
        "video_thumbnail": videoThumbnail?.toJson(),
      };
}

class Track {
  Album? album;
  List<Owner>? artists;
  List<String>? availableMarkets;
  int? discNumber;
  int? durationMs;
  bool? episode;
  bool? explicit;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  String? name;
  int? popularity;
  String? previewUrl;
  bool? track;
  int? trackNumber;
  String? type;
  String? uri;

  Track({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.episode,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.name,
    this.popularity,
    this.previewUrl,
    this.track,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        artists: json["artists"] == null
            ? []
            : List<Owner>.from(json["artists"]!.map((x) => Owner.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        episode: json["episode"],
        explicit: json["explicit"],
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        track: json["track"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album": album?.toJson(),
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "episode": episode,
        "explicit": explicit,
        "external_ids": externalIds?.toJson(),
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track": track,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
      };
}

class Album {
  String? albumType;
  List<Owner>? artists;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  // DateTime? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  Album({
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    // this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        artists: json["artists"] == null
            ? []
            : List<Owner>.from(json["artists"]!.map((x) => Owner.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: json["name"],
        // releaseDate: json["release_date"] == null
        //     ? null
        //     : DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
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
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        // "release_date":
        //     "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
      };
}

class ExternalIds {
  String? isrc;

  ExternalIds({
    this.isrc,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
      );

  Map<String, dynamic> toJson() => {
        "isrc": isrc,
      };
}

class VideoThumbnail {
  dynamic url;

  VideoThumbnail({
    this.url,
  });

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => VideoThumbnail(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
