// To parse this JSON data, do
//
//     final searchPlaylistModel = searchPlaylistModelFromJson(jsonString);

import 'dart:convert';

SearchPlaylistModel searchPlaylistModelFromJson(String str) =>
    SearchPlaylistModel.fromJson(json.decode(str));

String searchPlaylistModelToJson(SearchPlaylistModel data) =>
    json.encode(data.toJson());

class SearchPlaylistModel {
  Albums? albums;
  Artists? artists;
  Tracks? tracks;
  Playlists? playlists;

  SearchPlaylistModel({
    this.albums,
    this.artists,
    this.tracks,
    this.playlists,
  });

  factory SearchPlaylistModel.fromJson(Map<String, dynamic> json) =>
      SearchPlaylistModel(
        albums: json["albums"] == null ? null : Albums.fromJson(json["albums"]),
        artists:
            json["artists"] == null ? null : Artists.fromJson(json["artists"]),
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
        playlists: json["playlists"] == null
            ? null
            : Playlists.fromJson(json["playlists"]),
      );

  Map<String, dynamic> toJson() => {
        "albums": albums?.toJson(),
        "artists": artists?.toJson(),
        "tracks": tracks?.toJson(),
        "playlists": playlists?.toJson(),
      };
}

class Albums {
  String? href;
  List<Item>? items;
  int? limit;
  String? next;
  int? offset;
  dynamic previous;
  int? total;

  Albums({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
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

class Artists {
  String? href;
  List<Item>? items;
  int? limit;
  String? next;
  int? offset;
  dynamic previous;
  int? total;

  Artists({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
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

class Playlists {
  String? href;
  List<Item>? items;
  int? limit;
  String? next;
  int? offset;
  dynamic previous;
  int? total;

  Playlists({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Playlists.fromJson(Map<String, dynamic> json) => Playlists(
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

class Tracks {
  String? href;
  List<Item>? items;
  int? limit;
  String? next;
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// =================================>

class Item {
  String? albumType;
  List<Owner>? artists;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;
  Followers? followers;
  List<String>? genres;
  int? popularity;
  Album? album;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalIds? externalIds;
  bool? isLocal;
  String? previewUrl;
  int? trackNumber;
  bool? collaborative;
  String? description;
  Owner? owner;
  dynamic primaryColor;
  dynamic public;
  String? snapshotId;
  Followers? tracks;

  Item({
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
    this.followers,
    this.genres,
    this.popularity,
    this.album,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalIds,
    this.isLocal,
    this.previewUrl,
    this.trackNumber,
    this.collaborative,
    this.description,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
        releaseDate: json["release_date"],
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
        followers: json["followers"] == null
            ? null
            : Followers.fromJson(json["followers"]),
        genres: json["genres"] == null
            ? []
            : List<String>.from(json["genres"]!.map((x) => x)),
        popularity: json["popularity"],
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        isLocal: json["is_local"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        collaborative: json["collaborative"],
        description: json["description"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        primaryColor: json["primary_color"],
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks:
            json["tracks"] == null ? null : Followers.fromJson(json["tracks"]),
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
        "release_date": releaseDate,
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
        "followers": followers?.toJson(),
        "genres":
            genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "popularity": popularity,
        "album": album?.toJson(),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_ids": externalIds?.toJson(),
        "is_local": isLocal,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "collaborative": collaborative,
        "description": description,
        "owner": owner?.toJson(),
        "primary_color": primaryColor,
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks?.toJson(),
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
  String? releaseDate;
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
    this.releaseDate,
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
        releaseDate: json["release_date"],
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
        "release_date": releaseDate,
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
      };
}

class Owner {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;
  String? displayName;

  Owner({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
    this.displayName,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
        displayName: json["display_name"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
        "display_name": displayName,
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

class Followers {
  String? href;
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
