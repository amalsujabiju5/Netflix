import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/movie/top_rated?api_key=$apiKey";
  static const search = '$kBaseUrl/search/movie?api_key=$apiKey';

  static const hotAndNewMovie =
      '$kBaseUrl/discover/movie?api_key=$apiKey&with_genres';
  static const hotAndNewTv =
      '$kBaseUrl/discover/tv?api_key=$apiKey&with_genres';
}
