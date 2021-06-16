import 'package:flutter/material.dart';
import 'package:ganna/apis/songs_api.dart';
import 'package:ganna/models/song_item.dart';
import 'package:ganna/models/songs.dart';
import 'package:ganna/widgets/song_list_item/song_list_item.dart';

class SongList extends StatefulWidget {
  final SongItem songItem;

  const SongList({Key? key, required this.songItem}) : super(key: key);

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  late Future<SongModel> songModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    songModel = SongsApi().getSongs(widget.songItem.collectionArtistName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SongModel>(
      future: songModel,
      builder: (context, snapshot) {
        return snapshot.hasData && snapshot.data!.resultCount > 0
            ? SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var item = snapshot.data!.results[index];
                    return Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: SongListItem(songItem: item));
                  },
                  childCount: snapshot.data!.resultCount,
                ),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Center(
                          child: CircularProgressIndicator(
                            color: Colors.redAccent,
                          ),
                        ),
                    childCount: 1),
              );
      },
    );
  }
}
