class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3/";

  static const String baseUrlApiKey =
      "api_key=2564be38c6eb134dbf40f5278972daea";

  static const String nowPlayingBaseUrl =
      "${baseUrl}movie/now_playing?$baseUrlApiKey";

  static const String popularBaseUrl = "${baseUrl}movie/popular?$baseUrlApiKey";

  static const String topRatedBaseUrl =
      "${baseUrl}movie/top_rated?$baseUrlApiKey";

  static String moveDetailesUrlBase(int movieId) =>
      '${baseUrl}movie/$movieId?$baseUrlApiKey';

  static String recomandationUrlBase(int movieId) =>
      '${baseUrl}movie/$movieId/recommendations?$baseUrlApiKey';

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";
}

class ApiConstanceTv {
  static const String baseUrl = "https://api.themoviedb.org/3/";

  static const String baseUrlApiKey =
      "api_key=2564be38c6eb134dbf40f5278972daea";

  static const String onTheAirBaseUrl =
      "${baseUrl}tv/on_the_air?$baseUrlApiKey";

  static const String popularTvBaseUrl = "${baseUrl}tv/popular?$baseUrlApiKey";

  static const String topRatedTvBaseUrl =
      "${baseUrl}tv/top_rated?$baseUrlApiKey";

  static String tvDetailesUrlBase(int tvId) =>
      '${baseUrl}tv/$tvId?$baseUrlApiKey';

  static String tvrecomandationUrlBase(int tvId) =>
      '${baseUrl}tv/$tvId/recommendations?$baseUrlApiKey';

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";
}
