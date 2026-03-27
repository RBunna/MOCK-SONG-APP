// song_repository_mock.dart

import '../../../model/songs/song.dart';
import 'song_repository.dart';

class SongRepositoryMock implements SongRepository {
  final List<Song> _songs = [
    Song(
      id: 's1',
      title: 'Mock Song 1',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 2, seconds: 50),
      imageUrl: Uri.parse(
        'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=300&h=300&fit=crop&q=80',
      ),
    ),
    Song(
      id: 's2',
      title: 'Mock Song 2',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
      imageUrl: Uri.parse(
        'https://images.unsplash.com/photo-1501386761578-eac5c94b800a?w=300&h=300&fit=crop&q=80',
      ),
    ),
    Song(
      id: 's3',
      title: 'Mock Song 3',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
      imageUrl: Uri.parse(
        'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=300&h=300&fit=crop&q=80',
      ),
    ),
    Song(
      id: 's4',
      title: 'Mock Song 4',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
      imageUrl: Uri.parse(
        'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=300&h=300&fit=crop&q=80',
      ),
    ),
    Song(
      id: 's5',
      title: 'Mock Song 5',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
      imageUrl: Uri.parse(
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300&h=300&fit=crop&q=80',
      ),
    ),
  ];

  @override
  Future<List<Song>> fetchSongs() async {
    return Future.delayed(Duration(seconds: 4), () {
      throw Exception("G3 and G4 the class is finished");
    });
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    return Future.delayed(Duration(seconds: 4), () {
      return _songs.firstWhere(
        (song) => song.id == id,
        orElse: () => throw Exception("No song with id $id in the database"),
      );
    });
  }
}
