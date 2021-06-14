import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ganna/models/song_item.dart';
import 'package:ganna/widgets/song_player/SongPlayer.dart';

class SongScreen extends StatefulWidget {
  final SongItem songItem;

  const SongScreen({Key? key, required this.songItem}) : super(key: key);

  @override
  SongScreenState createState() => SongScreenState();
}

class SongScreenState extends State<SongScreen> {
  Future<bool> onBackPressed() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    var img = widget.songItem.artworkUrl100 != null
        ? widget.songItem.artworkUrl100
        : '';
    var titile = widget.songItem.trackName! + ' ' + widget.songItem.artistName!;

    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                // actions: [SongPlayer(songItem: widget.songItem)],
                title: Text(titile),
                floating: true,
                expandedHeight: height - 100,
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(img!), fit: BoxFit.cover)),
                  child: SongPlayer(songItem: widget.songItem),
                )),
              ),
              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     (context, index) => Text('s'),
              //     childCount: 100,
              //   ),
              // )
            ],
          )),
    );
  }
}

//https://itunes.apple.com/search/?term=${term}
