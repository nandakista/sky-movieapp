import 'package:skybase/domain/entities/genre.dart';

class GenreModel extends Genre {
  const GenreModel({
    required final int id,
    required final String name,
  }) : super(id: id, name: name);

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
