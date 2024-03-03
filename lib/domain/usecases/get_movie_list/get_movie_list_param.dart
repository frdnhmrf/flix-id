// ignore_for_file: public_member_api_docs, sort_constructors_first
enum MovieListCategories {
  nowPlaying,
  upcoming,
}

class GetMovieListParam {
  final int page;
  final MovieListCategories category;
  GetMovieListParam({
    required this.page,
    required this.category,
  });
}
