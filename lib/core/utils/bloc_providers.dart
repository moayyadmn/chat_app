import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/blocs/app_root_bloc/app_root_bloc.dart';
import 'package:scholarchat_app/core/blocs/app_root_bloc/app_root_event.dart';
import 'package:scholarchat_app/features/chat/view/manager/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/features/community/data/manager/fetch_user_cubit/fetch_user_cubit.dart';
import 'package:scholarchat_app/features/friends/data/manager/fetch_friends_cubit/fetch_friends_cubit.dart';
import 'package:scholarchat_app/features/login/data/login_cubit/login_cubit.dart';

class MyProviders {
  static get providers => [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => FetchUserCubit()..fetchUsers(),
        ),
        BlocProvider(
          create: (context) => FetchFriendsCubit()..fetchUsers(),
        ),
        BlocProvider(
          create: (context) => AppRootBloc()..add(AppRootEvent()),
        ),
        BlocProvider(create: (context) => ChatCubit()),
      ];
}
