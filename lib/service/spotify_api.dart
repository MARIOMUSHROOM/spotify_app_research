import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:spotify_skinx/service/api_service.dart';
import 'package:spotify_skinx/setting/contants.dart';

class SpotifyAPI {
  Future<Response> getToken() async {
    Options? optionOnly = Options(
      contentType: Headers.formUrlEncodedContentType,
    );
    var path = "$endPointAccount/token";
    var body = {
      "client_id": clientID,
      "client_secret": clientSecret,
      "grant_type": "client_credentials",
    };
    log("url : ${ApiService.client.options.baseUrl}$path");
    log("header : ${ApiService.client.options.headers}");
    log("body : $body");
    Response serviceRes = await Dio().post(
      path,
      queryParameters: body,
      options: optionOnly,
    );
    return serviceRes;
  }

  Future<Response> getMyPlaylists() async {
    var path = "/v1/me/playlists";
    log("url : ${ApiService.client.options.baseUrl}$path");
    log("header : ${ApiService.client.options.headers}");
    Response serviceRes = await ApiService.client.get(path);
    return serviceRes;
  }

  Future<Response> getPlaylists(String playlistId) async {
    var path = "/v1/playlists/$playlistId";
    log("url : ${ApiService.client.options.baseUrl}$path");
    log("header : ${ApiService.client.options.headers}");
    Response serviceRes = await ApiService.client.get(path);
    return serviceRes;
  }

  Future<Response> searchPlaylists(String searchText,
      {required int offset}) async {
    var path = "/v1/search";
    var params = {
      "q": searchText,
      "type": "album",
      "offset": offset,
      "limit": 10,
    };
    log("url : ${ApiService.client.options.baseUrl}$path");
    log("header : ${ApiService.client.options.headers}");
    Response serviceRes =
        await ApiService.client.get(path, queryParameters: params);
    return serviceRes;
  }

  Future<Response> getAlbum(String albumId) async {
    var path = "/v1/albums/$albumId";
    log("url : ${ApiService.client.options.baseUrl}$path");
    log("header : ${ApiService.client.options.headers}");
    Response serviceRes = await ApiService.client.get(path);
    return serviceRes;
  }
}
