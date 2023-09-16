import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/helper/extensions.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/friends/data/fetch_friends_cubit/fetch_friends_cubit.dart';
import 'package:scholarchat_app/features/friends/data/fetch_friends_cubit/fetch_friends_state.dart';
import 'package:scholarchat_app/features/friends/view/widgets/chat_card_widget.dart';
import 'package:scholarchat_app/features/friends/view/widgets/custom_home_app_bar.dart';
import '../../../core/utils/widgets/content_area.dart';
import 'widgets/status_avatar.dart';

class FriendsView extends StatelessWidget {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customScaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            10.spaceY,
            const CustomHomeAppBar(),
            15.spaceY,
            const StatusAvatar(),
            30.spaceY,
            ContentArea(
              child: Expanded(
                child: BlocBuilder<FetchFriendsCubit, FetchFriendsSate>(
                  builder: (context, state) {
                    if (state is FetchFriendsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kGreenColor,
                        ),
                      );
                    } else if (state is FetchFriendsSuccess) {
                      return ListView.builder(
                        itemCount: state.userDataList.length,
                        itemBuilder: (context, index) {
                          return ChatCardWidget(
                            chatListCardModel: state.userDataList[index],
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
