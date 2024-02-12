import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:spotify_skinx/feature/my_playlist/controller/my_play_list_controller.dart';
import 'package:spotify_skinx/models/my_playlist_model.dart' as models;
import "package:spotify_skinx/setting/theme.dart";

class MyPlayListPage extends StatefulWidget {
  const MyPlayListPage({super.key});

  @override
  State<MyPlayListPage> createState() => _MyPlayListPageState();
}

class _MyPlayListPageState extends State<MyPlayListPage> {
  MyPlayListViewModel? controller;
  @override
  void initState() {
    controller = MyPlayListViewModel(context);
    controller!.init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return ChangeNotifierProvider.value(
      value: controller,
      child: Consumer<MyPlayListViewModel>(builder: (context, con, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Mixed for you"),
            actions: [
              GestureDetector(
                onTap: () {
                  con.goToSearch();
                },
                child: const Icon(
                  Icons.search,
                  color: primaryColor,
                ),
              ),
              Container(
                height: 30,
                width: 30,
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  "R",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          ),
          body: GridView.builder(
            itemCount: con.myPlaylists?.items?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (BuildContext context, int index) {
              models.Item only = con.myPlaylists!.items![index];
              return GestureDetector(
                onTap: () {
                  con.goToDetail(only);
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(
                            only.images?.first.url ?? "",
                            fit: BoxFit.fill,
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
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${only.name ?? ""} ",
                                  style: TextStyle(color: primaryColor),
                                ),
                                Text(
                                  "${only.description ?? ""} ",
                                  style: TextStyle(color: primaryColor),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
