// To parse this JSON data, do
//
//     final SongModel = SongModelFromJson(jsonString);

import 'dart:convert';

import 'package:ganna/models/song_item.dart';

SongModel SongModelFromJson(String str) => SongModel.fromJson(json.decode(str));

String SongModelToJson(SongModel data) => json.encode(data.toJson());

class SongModel {
  SongModel({
    required this.resultCount,
    required this.results,
  });

  int resultCount;
  List<SongItem> results;

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
        resultCount: json["resultCount"],
        results: List<SongItem>.from(
            json["results"].map((x) => SongItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
