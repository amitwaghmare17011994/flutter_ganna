import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ganna/apis/songs_api.dart';
import 'package:ganna/models/song_item.dart';
import 'package:ganna/models/songs.dart';
import 'package:ganna/widgets/song_list/song_list.dart';
import 'package:ganna/widgets/song_player/SongPlayer.dart';

class SongScreen extends StatefulWidget {
  final SongItem songItem;

  const SongScreen({Key? key, required this.songItem}) : super(key: key);

  @override
  SongScreenState createState() => SongScreenState();
}

class SongScreenState extends State<SongScreen> {
  late double playerHeight = 500;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> onBackPressed() async {
    return true;
  }

  onExpandToggle(value) {
    setState(() {
      playerHeight = value ? MediaQuery.of(context).size.height : 500;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = playerHeight;

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
                expandedHeight: height,
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(img!), fit: BoxFit.cover)),
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 100),
                      child: SongPlayer(
                        songItem: widget.songItem,
                        onExpandToggle: onExpandToggle,
                      )),
                )),
              ),
              SongList(
                songItem: widget.songItem,
              ),
            ],
          )),
    );
  }
}

//https://itunes.apple.com/search/?term=${term}
