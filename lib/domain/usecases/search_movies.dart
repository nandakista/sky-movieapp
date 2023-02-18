import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;
  SearchMovies({required this.repository});

  Future<List<Movie>> call(String query) {
    return repository.searchMovies(query: query);
  }
}
