import '../../../model/songs/song.dart';

abstract class SongRepository {
  Future<List<Song>> fetchSongs();

  Future<Song?> fetchSongById(String id);

  Future<void> updateSongLike(String id, int newLike);
}
