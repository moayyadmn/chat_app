import 'package:get_it/get_it.dart';
import 'package:scholarchat_app/features/community/data/repos/community_repo_imp.dart';
import 'package:scholarchat_app/features/friends/data/repo/friends_repo_imp.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CommunityRepoImpl>(CommunityRepoImpl());
  getIt.registerSingleton<FriendsRepoImpl>(FriendsRepoImpl());
}
