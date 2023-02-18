import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/repositories/movie_repository.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;
  GetNowPlayingMovies({required this.repository});

  Future<List<Movie>> call() async {
    return await repository.getNowPlayingMovies();
  }
}
