import "dart:ui";

import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:spotify_skinx/feature/album_detail/controller/album_detail_controller.dart';
import 'package:spotify_skinx/models/album_model.dart' as models;
import "package:spotify_skinx/setting/theme.dart";
import "package:spotify_skinx/widgets/sizer.dart";

class AlbumDetailPage extends StatefulWidget {
  const AlbumDetailPage({
    super.key,
    required this.albumId,
  });
  final String albumId;
  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  AlbumDetailViewModel? controller;
  @override
  void initState() {
    controller = AlbumDetailViewModel(context, albumId: widget.albumId);
    controller!.init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: Consumer<AlbumDetailViewModel>(builder: (context, con, _) {
        return Stack(
          children: [
            Container(
              width: Sizer(context).w,
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Image.network(
                      "${con.albums?.images?.first.url}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: ClipRRect(
                      // Clip it cleanly.
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.grey.withOpacity(0.1),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      width: Sizer(context).w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            stops: const [
                              0.1,
                              0.5,
                              0.9
                            ],
                            colors: [
                              Colors.black,
                              Colors.black.withOpacity(.8),
                              Colors.transparent,
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text("${con.albums?.name ?? ""} "),
                backgroundColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
              ),
              body: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: Sizer(context).w,
                    alignment: Alignment.center,
                    child: Image.network(
                      "${con.albums?.images?.first.url}",
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.download,
                        color: primaryColor,
                      ),
                      const Icon(
                        Icons.add_box,
                        color: primaryColor,
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          size: 40,
                        ),
                      ),
                      const Icon(
                        Icons.offline_share_outlined,
                        color: primaryColor,
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: con.albums?.tracks?.items?.length ?? 0,
                      itemBuilder: (context, index) {
                        models.Item only = con.albums!.tracks!.items![index];
                        return Container(
                            // color: Colors.green,
                            child: Row(
                          children: [
                            Container(
                                height: 70,
                                width: 70,
                                child: Center(
                                    child: Text(
                                  "$index",
                                  style: const TextStyle(color: primaryColor),
                                ))),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " ${only.name ?? ""}",
                                    style: const TextStyle(color: primaryColor),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "${only.artists?.first.name ?? ""} ",
                                          style: const TextStyle(
                                              color: primaryColor),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "• ${only.durationMs ?? ""} ",
                                          style: const TextStyle(
                                              color: primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.more_vert,
                              color: primaryColor,
                            ),
                          ],
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
