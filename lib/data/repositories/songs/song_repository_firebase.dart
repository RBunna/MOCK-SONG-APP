import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import '../../firebase/firebase_database.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  @override
  Future<List<Song>> fetchSongs() async {
    final songsUri = FirebaseConfig.baseUri.replace(path: "/songs.json");
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);

      List<Song> result = [];
      for (final entry in songJson.entries) {
        result.add(SongDto.fromJson(entry.key, entry.value));
      }
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load songs');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    final songsUri = FirebaseConfig.baseUri.replace(path: "/songs/$id.json");
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);

      Song result = SongDto.fromJson(id, songJson);
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load song');
    }
  }

  @override
  Future<void> updateSongLike(String id, int newLike) async {
    final songsUri = FirebaseConfig.baseUri.replace(path: "/songs/$id.json");
    final http.Response response = await http.patch(
      songsUri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{SongDto.likeKey: newLike}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update like count');
    }
  }
}
