import 'package:hive/hive.dart';
import 'package:skybase/domain/entities/repo/repo.dart';
import 'package:skybase/domain/entities/sample_feature/sample_feature.dart';

class HiveAdapters {
  static const String person = 'PersonAdapter';
  static const String repo = 'RepoAdapter';

  static register() {
    Hive.registerAdapter(PersonAdapter());
    Hive.registerAdapter(RepoAdapter());
  }
}
