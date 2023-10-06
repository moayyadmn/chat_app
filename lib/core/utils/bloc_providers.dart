import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/blocs/app_root_bloc/app_root_bloc.dart';
import 'package:scholarchat_app/core/blocs/app_root_bloc/app_root_event.dart';
import 'package:scholarchat_app/core/utils/service_locator.dart';
import 'package:scholarchat_app/features/community/data/repos/community_repo_imp.dart';
import 'package:scholarchat_app/features/community/view/manager/fetch_user_cubit/fetch_user_cubit.dart';
import 'package:scholarchat_app/features/friends/data/repo/friends_repo_imp.dart';
import 'package:scholarchat_app/features/friends/view/manager/fetch_friends_cubit/fetch_friends_cubit.dart';
import 'package:scholarchat_app/features/login/data/login_cubit/login_cubit.dart';

class MyProviders {
  static get providers => [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) =>
              FetchUserCubit(getIt.get<CommunityRepoImpl>())..fetchUsers(),
        ),
        BlocProvider(
          create: (context) =>
              FetchFriendsCubit(getIt.get<FriendsRepoImpl>())..fetchUsers(),
        ),
        BlocProvider(
          create: (context) => AppRootBloc()..add(AppRootEvent()),
        ),
      ];
}
