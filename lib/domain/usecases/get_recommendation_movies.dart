import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/repositories/movie_repository.dart';

class GetRecommendationMovies {
  final MovieRepository repository;
  GetRecommendationMovies({required this.repository});

  Future<List<Movie>> call({required int id}) async {
    return await repository.getRecommendedMovies(id: id);
  }
}
