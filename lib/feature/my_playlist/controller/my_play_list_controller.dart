import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spotify_skinx/feature/playlist_detail/pages/playlist_detail_page.dart';
import 'package:spotify_skinx/feature/search/pages/search_page.dart';
import 'package:spotify_skinx/models/my_playlist_model.dart';
import 'package:spotify_skinx/service/api_service.dart';
import 'package:spotify_skinx/service/spotify_api.dart';
import 'package:spotify_skinx/setting/contants.dart';
import 'package:spotify_skinx/widgets/toast_v3_widget.dart';

class MyPlayListViewModel extends ChangeNotifier {
  MyPlayListViewModel(this.context);
  BuildContext context;

  MyPlaylistModel? myPlaylists;
  init() async {
    await getToken();
    await getPlaylist();
  }

  goToSearch() {
    var route = MaterialPageRoute(builder: (context) => const SearchPage());
    Navigator.push(context, route);
  }

  goToDetail(Item only) {
    var route = MaterialPageRoute(
        builder: (context) => PlaylistDetailPage(playlistId: only.id!));
    Navigator.push(context, route);
  }

  getToken() async {
    try {
      var source = await SpotifyAPI().getToken();
      if (source.statusCode != 200) {
        throw "Connection : ${source.statusCode}";
      }
      // log("success : ${source.data['access_token']}");
      // String token = source.data['access_token'];
      ApiService.setHeaderToken(backendToken);
      notifyListeners();
    } catch (e) {
      log("e : $e");
      ToastWidget(context).show(message: "$e");
    }
  }

  getPlaylist() async {
    try {
      var source = await SpotifyAPI().getMyPlaylists();
      if (source.statusCode != 200) {
        throw "Connection : ${source.statusCode}";
      }
      log("rs : ${source.data}");
      myPlaylists = MyPlaylistModel.fromJson(source.data);
      notifyListeners();
    } catch (e) {
      log("e : $e");
      ToastWidget(context).show(message: "$e");
    }
  }
}
