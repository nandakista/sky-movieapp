import 'package:hive/hive.dart';
import 'package:skybase/core/database/hive/entity/user_entity.dart';
import 'package:skybase/core/database/hive/hive_adapters.dart';
import 'package:skybase/core/database/hive/hive_box.dart';
import 'package:skybase/data/models/repo_model.dart';
import 'package:skybase/data/models/sample_feature_model.dart';

part 'sample_feature.g.dart';

@HiveType(typeId: HiveBox.userId, adapterName: HiveAdapters.person)
class SampleFeature {
  @HiveField(UserEntity.id)
  int id;

  @HiveField(UserEntity.username)
  String username;

  @HiveField(UserEntity.name)
  String? name;

  @HiveField(UserEntity.location)
  String? location;

  @HiveField(UserEntity.company)
  String? company;

  @HiveField(UserEntity.gitUrl)
  String? gitUrl;

  @HiveField(UserEntity.bio)
  String? bio;

  @HiveField(UserEntity.avatarUrl)
  String? avatarUrl;

  @HiveField(UserEntity.repository)
  int? repository;

  @HiveField(UserEntity.followers)
  int? followers;

  @HiveField(UserEntity.following)
  int? following;

  @HiveField(UserEntity.repositoryList)
  List<RepoModel>? repositoryList;

  @HiveField(UserEntity.followersList)
  List<SampleFeatureModel>? followersList;

  @HiveField(UserEntity.followingList)
  List<SampleFeatureModel>? followingList;

  SampleFeature({
    required this.id,
    required this.username,
    this.name,
    this.location,
    this.company,
    this.gitUrl,
    this.bio,
    this.avatarUrl,
    this.repository,
    this.followers,
    this.following,
    this.repositoryList,
    this.followersList,
    this.followingList,
  });

  SampleFeatureModel toModel() {
    return SampleFeatureModel(
      id: id,
      username: username,
      name: name,
      avatarUrl: avatarUrl,
      bio: bio,
      company: company,
      followers: followers,
      followersList: followersList,
      following: following,
      followingList: followingList,
      gitUrl: gitUrl,
      location: location,
      repository: repository,
      repositoryList: repositoryList,
    );
  }
}
