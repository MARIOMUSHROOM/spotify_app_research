import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:spotify_skinx/feature/search/view_model/search_view_model.dart";
import "package:spotify_skinx/models/search_playlist_model.dart" as models;
import "package:spotify_skinx/setting/theme.dart";
import "package:spotify_skinx/widgets/sizer.dart";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchViewModel? controller;
  ScrollController? scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = SearchViewModel(context);
    controller!.init();
    scrollController!.addListener(() {
      if (scrollController!.offset ==
          scrollController!.position.maxScrollExtent) {
        controller!.maxScroll();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    scrollController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: Consumer<SearchViewModel>(builder: (context, con, _) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                con.backButton();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: primaryColor,
              ),
            ),
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 40.0,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: con.searchTextController,
                      focusNode: con.searchFocusNode,
                      cursorColor: primaryColor,
                      onChanged: (value) => con.onSearchTextChanged(value),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: primaryColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle:
                            TextStyle(color: primaryColor.withOpacity(0.4)),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(bottom: 12.0),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  clearSearchText(con)
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: true,
                    shrinkWrap: true,
                    itemCount: con.searchList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      models.Item only = con.searchList[index];
                      return GestureDetector(
                        onTap: () {
                          con.goToDetail(only);
                        },
                        child: Container(
                          width: Sizer(context).w,
                          padding: const EdgeInsets.all(5),
                          child: Builder(builder: (context) {
                            switch (only.type?.toLowerCase()) {
                              case 'album':
                                return albumTypeWidget(only);
                              case 'artist':
                                return artistTypeWidget(only);
                              case 'track':
                                return trackTypeWidget(only);
                              case 'playlist':
                                return playlistTypeWidget(only);

                              default:
                            }
                            return const SizedBox();
                          }),
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget clearSearchText(SearchViewModel con) {
    return Visibility(
      visible: con.clearText,
      child: Container(
        height: 30.0,
        width: 30.0,
        padding: EdgeInsets.zero,
        child: InkWell(
          onTap: con.clearSearchText,
          child: const Icon(
            Icons.close,
            color: primaryColor,
          ),
        ),
      ),
    );
  }

  Widget albumTypeWidget(models.Item only) {
    return Container(
      // color: Colors.yellow,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              only.images?.first.url ?? "",
              fit: BoxFit.fill,
              height: 80,
              width: 80,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        only.name ?? "",
                        style: TextStyle(fontSize: 16.0, color: primaryColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Album : ${only.artists?.first.name ?? ""}',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget artistTypeWidget(models.Item only) {
    return Container(
      // color: Colors.green,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              only.images?.first.url ?? "",
              fit: BoxFit.fill,
              height: 80,
              width: 80,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        only.name ?? "",
                        style: TextStyle(fontSize: 16.0, color: primaryColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Follower : ${only.followers?.total ?? ""}',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget trackTypeWidget(models.Item only) {
    return Container(
      // color: Colors.red,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              only.album?.images?.first.url ?? "",
              fit: BoxFit.fill,
              height: 80,
              width: 80,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        only.name ?? "",
                        style: TextStyle(fontSize: 16.0, color: primaryColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Album : ${only.album?.name ?? ""}',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget playlistTypeWidget(models.Item only) {
    return Container(
      // color: Colors.orange,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              only.images?.first.url ?? "",
              fit: BoxFit.fill,
              height: 80,
              width: 80,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        only.name ?? "",
                        style: TextStyle(fontSize: 16.0, color: primaryColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${only.owner?.displayName ?? ""} : ${only.name ?? ""}',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
