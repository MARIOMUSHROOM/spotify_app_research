import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spotify_skinx/models/album_model.dart';
import 'package:spotify_skinx/service/spotify_api.dart';
import 'package:spotify_skinx/widgets/toast_v3_widget.dart';

class AlbumDetailViewModel extends ChangeNotifier {
  AlbumDetailViewModel(this.context, {required this.albumId});
  BuildContext context;
  String albumId;
  AlbumModel? albums;
  init() async {
    await getAlbum();
  }

  // goToSearch() {
  //   var route = MaterialPageRoute(builder: (context) => const SearchPage());
  //   Navigator.push(context, route);
  // }

  getAlbum() async {
    try {
      var source = await SpotifyAPI().getAlbum(albumId);
      if (source.statusCode != 200) {
        throw "Connection : ${source.statusCode}";
      }
      albums = AlbumModel.fromJson(source.data);
      notifyListeners();
    } catch (e) {
      log("e : $e");
      ToastWidget(context).show(message: "$e");
    }
  }
}
