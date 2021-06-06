import 'package:flutter/material.dart';
import 'package:ganna/apis/songs_api.dart';
import 'package:ganna/models/songs.dart';
import 'package:ganna/widgets/song_card/SongCard.dart';

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
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('First Screen'),
        ),
        body: Container(
          child: FutureBuilder<SongModel>(
            future: songModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.results.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data!.results[index];
                      return SongCard(
                        songItem: item,
                      );
                    });
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}

//https://itunes.apple.com/search/?term=${term}
