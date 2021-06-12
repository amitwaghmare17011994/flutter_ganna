import 'package:flutter/material.dart';
import 'package:ganna/animations/enter_exit_route/enter_exit_route.dart';
import 'package:ganna/animations/slide_right_route/slide_right_route.dart';
import 'package:ganna/apis/songs_api.dart';
import 'package:ganna/models/songs.dart';
import 'package:ganna/provider/google_sign_in_provider.dart';
import 'package:ganna/screens/song_screen/song_screen.dart';
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
  @override
  void initState() {
    songModel = SongsApi().getSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: Container(
            child: FutureBuilder<SongModel>(
              future: songModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        title: Text("Gaana"),
                        // floating: true,
                        expandedHeight: 50,
                        actions: <Widget>[Menu()],
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
                      )
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
