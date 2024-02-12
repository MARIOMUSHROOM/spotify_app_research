import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spotify_skinx/feature/album_detail/pages/album_detail_page.dart';
import 'package:spotify_skinx/models/search_playlist_model.dart';
import 'package:spotify_skinx/service/spotify_api.dart';
import 'package:spotify_skinx/widgets/toast_v3_widget.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel(this.context);
  BuildContext context;

  List<Item> searchList = [];
  int offset = 0;
  bool hasMore = true;
  bool clearText = false;
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchTextController = TextEditingController();
  init() async {
    searchList = [];
  }

  backButton() {
    Navigator.pop(context);
  }

  goToDetail(Item only) {
    var route = MaterialPageRoute(
        builder: (context) => AlbumDetailPage(albumId: only.id!));
    Navigator.push(context, route);
  }

  clearSearchText() {
    searchTextController.clear();
    notifyListeners();
  }

  onSearchTextChanged(String value) async {
    if (searchTextController.text.isNotEmpty) {
      searchList = [];
      searchPlaylists();
    }
    notifyListeners();
  }

  searchPlaylists() async {
    try {
      var source = await SpotifyAPI()
          .searchPlaylists(searchTextController.text, offset: offset);
      if (source.statusCode != 200) {
        throw "Connection : ${source.statusCode}";
      }
      SearchPlaylistModel search = SearchPlaylistModel.fromJson(source.data);
      if (search.albums?.items == null) {
        hasMore = false;
        notifyListeners();
        throw "Empty";
      }
      searchList.addAll(search.albums!.items!);
      notifyListeners();
    } catch (e) {
      log("e : $e");
      ToastWidget(context).show(message: "$e");
    }
  }

  void maxScroll() {
    if (hasMore) {
      offset = offset + 10;
      getMorePlaylist(offset);
    }
  }

  getMorePlaylist(int newOffset) async {
    try {
      var source = await SpotifyAPI()
          .searchPlaylists(searchTextController.text, offset: newOffset);
      if (source.statusCode != 200) {
        throw "Connection : ${source.statusCode}";
      }
      SearchPlaylistModel search = SearchPlaylistModel.fromJson(source.data);
      if (search.albums?.items == null) {
        hasMore = false;
        notifyListeners();
        throw "Empty";
      }
      searchList.addAll(search.albums!.items!);
      notifyListeners();
    } catch (e) {
      log("e : $e");
      ToastWidget(context).show(message: "$e");
    }
  }
}
