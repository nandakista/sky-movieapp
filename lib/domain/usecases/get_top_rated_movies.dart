import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/repositories/movie_repository.dart';

class GetTopRatedMovies {
  final MovieRepository repository;
  GetTopRatedMovies({required this.repository});

  Future<List<Movie>> call() async {
    return await repository.getTopRatedMovies();
  }
}
