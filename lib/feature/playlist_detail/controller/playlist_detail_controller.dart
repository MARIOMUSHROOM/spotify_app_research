import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spotify_skinx/models/playlist_model.dart';
import 'package:spotify_skinx/service/spotify_api.dart';
import 'package:spotify_skinx/widgets/toast_v3_widget.dart';

class PlaylistDetailViewModel extends ChangeNotifier {
  PlaylistDetailViewModel(this.context, {required this.playlistId});
  BuildContext context;
  String playlistId;
  PlaylistModel? playlistModel;
  init() async {
    await getPlaylist();
  }

  getPlaylist() async {
    try {
      var source = await SpotifyAPI().getPlaylists(playlistId);
      if (source.statusCode != 200) {
        throw "Connection : ${source.statusCode}";
      }
      log("rs : ${source.data}");
      playlistModel = PlaylistModel.fromJson(source.data);
      notifyListeners();
    } catch (e) {
      log("e : $e");
      ToastWidget(context).show(message: "$e");
    }
  }
}
