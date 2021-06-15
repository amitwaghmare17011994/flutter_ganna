import 'package:flutter/material.dart';
import 'package:ganna/animations/enter_exit_route/enter_exit_route.dart';
import 'package:ganna/animations/slide_right_route/slide_right_route.dart';
import 'package:ganna/apis/songs_api.dart';
import 'package:ganna/models/songs.dart';
import 'package:ganna/provider/google_sign_in_provider.dart';
import 'package:ganna/screens/song_screen/song_screen.dart';
import 'package:ganna/widgets/floating_search_bar/floating_search_bar.dart';
import 'package:ganna/widgets/menu/menu.dart';
import 'package:ganna/widgets/sign_in_button/sign_in_button.dart';
import 'package:ganna/widgets/skeleton/skeleton.dart';
import 'package:ganna/widgets/skeleton_card/skeleton_card.dart';
import 'package:ganna/widgets/song_card/SongCard.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<SongModel> songModel;
  late ScrollController scrollController;
  late bool hideSearch = true;
  var searchTextController = TextEditingController(text: '');
  // .addListener(() {});

  @override
  void initState() {
    super.initState();
    songModel = SongsApi().getSongs('');

    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {
        hideSearch = !isAppBarExpanded;
      });
    });
  }

  bool get isAppBarExpanded {
    return scrollController.hasClients &&
        scrollController.offset > (200 - kToolbarHeight);
  }

  void onSearchSubmited(value) {
    songModel = SongsApi().getSongs(value);
    setState(() {
      songModel = songModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Visibility(
            child: FloatingSearchBar(onSearchSubmited: onSearchSubmited),
            visible: !hideSearch),
        // floatingActionButton: hideSearch ? Container() : FloatingSearchBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: Container(
            child: FutureBuilder<SongModel>(
              future: songModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomScrollView(
                    controller: scrollController,
                    slivers: <Widget>[
                      SliverAppBar(
                        title: Text("Gaana"),
                        // floating: true,
                        expandedHeight: 120,
                        actions: <Widget>[Menu()],
                        flexibleSpace: Visibility(
                          visible: hideSearch,
                          child: FlexibleSpaceBar(
                            background: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: TextField(
                                        controller: searchTextController,
                                        onSubmitted: onSearchSubmited,
                                        onChanged: onSearchSubmited,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.search),
                                            suffixIcon: GestureDetector(
                                                onTap: () {
                                                  onSearchSubmited('');
                                                  searchTextController.text =
                                                      '';
                                                },
                                                child:
                                                    Icon(Icons.close_rounded)),
                                            fillColor: Colors.white,
                                            filled: true,
                                            contentPadding: EdgeInsets.all(10),
                                            border: new OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            hintText: 'Search...'),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => SongCard(
                            songItem: snapshot.data!.results[index],
                            onSongSelect: (songItem) => {
                              Navigator.push(
                                  context,
                                  SlideRightRoute(
                                      page: SongScreen(songItem: songItem)))
                            },
                          ),
                          childCount: snapshot.data!.results.length,
                        ),
                      ),
                    ],
                  );
                }
                return CustomScrollView(slivers: <Widget>[
                  SliverAppBar(
                    title: Text("Gaana"),
                    floating: true,
                    expandedHeight: 50,
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => SkeletonCard(),
                          childCount: 10))
                ]);
              },
            ),
          ),
        ));
  }
}

//https://itunes.apple.com/search/?term=${term}
