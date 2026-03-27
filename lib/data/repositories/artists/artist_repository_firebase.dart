import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/artists/artist.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  static const firebaseUrl = String.fromEnvironment('FIREBASE_URL');

  late final Uri ArtistsUri;

  ArtistRepositoryFirebase() {
    if (firebaseUrl.isEmpty) {
      throw Exception(
        'FIREBASE_URL is not set. Use --dart-define=FIREBASE_URL=your_url',
      );
    }

    ArtistsUri = Uri.https(Uri.parse(firebaseUrl).authority, '/artists.json');
  }

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(ArtistsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of Artists
      Map<String, dynamic> ArtistJson = json.decode(response.body);
      return ArtistJson.entries
          .map((item) => ArtistDto.fromJson(item.key, item.value))
          .toList();
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {}
}
