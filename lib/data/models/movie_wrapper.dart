import 'package:equatable/equatable.dart';

import 'movie_model.dart';

class MovieWrapper extends Equatable {
  final List<MovieModel> data;

  const MovieWrapper({required this.data});

  factory MovieWrapper.fromJson(Map<String, dynamic> json) => MovieWrapper(
        data: List<MovieModel>.from(
          (json["results"] as List)
              .map((x) => MovieModel.fromJson(x))
              .where((element) => element.posterPath != null),
        ),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(
          data.map(
            (x) => x.toJson(),
          ),
        ),
      };

  @override
  List<Object> get props => [data];
}
