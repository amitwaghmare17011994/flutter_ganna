import 'dart:convert';

import 'package:ganna/models/songs.dart';
import 'package:http/http.dart' as http;

class SongsApi {
  Future<SongModel> getSongs(String? term) async {
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(
          'https://itunes.apple.com/search/?term=${term == '' ? 'tu hi meri shab hai' : term}'));

      var jsonString = response.body;

      var jsonMap = json.decode(jsonString);
      var songModel = new SongModel.fromJson(jsonMap);

      return songModel;
    } catch (err) {
      print(err);
      throw err;
    }
  }
}
