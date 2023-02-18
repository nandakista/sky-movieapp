import 'package:skybase/domain/entities/movie_detail.dart';
import 'package:skybase/domain/repositories/movie_repository.dart';

class GetDetailMovie {
  final MovieRepository repository;
  GetDetailMovie({required this.repository});

  Future<MovieDetail?> call({required int id}) async {
    return await repository.getDetailMovie(id: id);
  }
}
