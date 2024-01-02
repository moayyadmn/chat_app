import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scholarchat_app/core/helper/extensions.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/core/utils/widgets/content_area.dart';
import 'package:scholarchat_app/core/utils/widgets/custom_app_bar.dart';
import 'package:scholarchat_app/features/community/data/manager/fetch_user_cubit/fetch_user_cubit.dart';
import 'package:scholarchat_app/features/community/data/manager/fetch_user_cubit/fetch_user_state.dart';
import 'package:scholarchat_app/features/community/view/widgets/user_card_widget.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customScaffoldColor,
      body: Column(
        children: [
          17.spaceY,
          CustomAppBar(
            text: 'Community',
            icon: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  //cspell:disable-next-line
                  "assets/svg/circle_icon.svg",
                ),
                SvgPicture.asset(
                  //cspell:disable-next-line
                  "assets/svg/user-add.svg",
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          15.spaceY,
          ContentArea(
            child: Expanded(child: BlocBuilder<FetchUserCubit, FetchUserState>(
              builder: (context, state) {
                if (state is FetchUserLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: kGreenColor,
                    ),
                  );
                } else if (state is FetchUserSuccess) {
                  return ListView.builder(
                    itemCount: state.userDataList.length,
                    itemBuilder: (context, index) {
                      var user = state.userDataList[index];
                      if (user.id == currentUser!.uid) {
                        return const SizedBox.shrink();
                      } else {
                        return UserCardWidget(user: state.userDataList[index]);
                      }
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
            )),
          ),
        ],
      ),
    );
  }
}
